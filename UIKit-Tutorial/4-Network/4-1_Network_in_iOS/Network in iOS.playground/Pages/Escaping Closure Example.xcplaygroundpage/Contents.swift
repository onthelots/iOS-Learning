//: [Previous](@previous)

import Foundation

/// Escaping Closure : 클로저가 함수의 인자로 전달되었을 때 -> 함수의 실행이 종료된 이후 -> 실행되는 클로저

// MARK: - Non-Escaping Closure (기본)

// 매개변수로 들어오는 클로저가 실행되는 함수(checkSoldOutStatus)

//class playerManager {
//
//    static let shared = playerManager()
//
//    func checkPlayerInfo(name: () -> Void) {
//        name()
//    }
//}
//
//playerManager.shared.checkPlayerInfo {
//    print("Kim")
//}


// 함수의 매개변수값으로 name(클로저)을 Callback 함수로 할당했을 때

/*
 함수가 실행되는 순서
 1. 프린트 구문(클로저)이 checkPlayerInfo 함수의 매개변수 값으로 할당됨
 2. checkPlayerInfo 함수 내부에서 매개변수 클로저(즉, 프린트 구문)가 실행됨
 3. nonEscapingClosure 함수는 프린트 구문을 반환하고 종료됨 (end)
 */

//  --> 매개변수 값으로 할당된 프린트 구문(클로저)은 checkPlayerInfo '함수가 종료되기 전'에 이미 실행됨
//  --> 다시 말해, 함수가 종료되기 전에 프린트 구문(클로저)은 '반드시 실행'되어야 함
 
// MARK: - 콜백 함수가 뒤늦게 실행되는 경우 (Non-Escaping Closure의 오류)
// ?? 그런데, 함수가 종료된 이후, 프린트 을 비동기적으로 처리해야 한다면?
// 혹은, 플레이어의 정보(name)을 변수에 저장하고 싶다면?
 
//class playerManager {
//
//    static let shared = playerManager()
//
//    private var playersName: () -> Void = { }
//
//    func checkPlayerInfo(name: () -> Void) {
//        playersName = name
//        playersName()
//    }
//}

/*
 Error : Assigning non-escaping parameter 'name' to an @escaping closure
 --> non-escaping 클로저의 매개변수로 전달되는 값은, Scope 외부의 변수 혹은 상수에 저장될 수 없습니다.
     (이유는 메모리 관리때문! 다음 포스팅에서 설명)
 --> 다시 말해, 함수가 종료되기 전에 해당 클로저 작업은 실행되어야 하는데, 그렇지 못하므로 해당 에러가 발생합니다.
 */



// MARK: - Escaping Closure 1. 외부 변수 혹은 상수에 저장할 수 있다!
// 1. 파라미터로 전달된 클로저를 외부 변수 혹은 상수에 저장할 수 있음

class playerManager {

    var playerName: () -> Void = { }

    static let shared = playerManager()

    func checkPlayerInfo(name: @escaping () -> Void) {
        playerName = name
        playerName()
    }
}
//
//// 외부 Scope에서
playerManager.shared.checkPlayerInfo {
    print("Kim")
}
//
//
let playerNameCheck = playerManager.shared.playerName
//
playerNameCheck() // Kim (변수에 저장이 되었다!)

// MARK: - Escaping Closure 2. 함수가 종료된 이후에 클로저가 실행될 수 있다 (비동기 작업 -> 순서대로ㅜ
// Non-Escaping Closure와는 달리, 함수가 종료된 이후에도 해당 클로저가 실행될 수 있음 (즉, 비동기 작업이 가능함)
// 예시 : github API를 통해 프로필 정보를 비동기 방식으로 호출하기

enum NetworkError: Error {
  case invalidRequest
  case transportError(Error)
  case responseError(statusCode: Int)
  case noData
  case decodingError(Error)
}

// Decoding을 위한 Data (Codable / CodingKeys)
struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

// githubprofile을 호출하시오

// MARK: - NetworkService
final class NetworkService {
    
    // session (초기값 없는) 프로퍼티
    let session: URLSession
    
    // inititalizer -> configure
    init(configure: URLSessionConfiguration) {
        self.session = URLSession(configuration: configure)
    }
    
    // fetch 함수
    // completion 클로저는 Escaping Closure로, 해당 호출함수가 종료된 이후에도 조건에 의해 순차적으로 실행될 수 있음
    // 2️⃣ 데이터 요청을 위한 함수를 실행
    func fetchGithubProfiles(username: String,
                             completeion: @escaping (Result<GithubProfile, Error>) -> Void) {
        
        let url = URL(string: "https://api.github.com/users/\(username)")!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            // error -> transportError
            if let error = error {
                completeion(.failure(NetworkError.transportError(error)))
                return
            }
            
            // response
            if let httpResponse = response as? HTTPURLResponse,
               !(200..<300).contains(httpResponse.statusCode) {
                completeion(.failure(NetworkError.responseError(statusCode: httpResponse.statusCode)))
                return
            }
            
            // data
            guard let data = data else {
                completeion(.failure(NetworkError.noData))
                return
            }
            
            // decoding
            do {
                // 3️⃣ decoding 작업이 완료된 후 -> completion을 호출함
                let decoder = JSONDecoder()
                let profiles = try decoder.decode(GithubProfile.self, from: data)
                completeion(.success(profiles))
            } catch let error {
                completeion(.failure(NetworkError.decodingError(error)))
            }
        }
        task.resume()
    }
}

// 클래스 인스턴스 객체 생성 -> default
let networkService = NetworkService(configure: .default)

// 1️⃣ fetchGithubProfiles 함수를 실행 -> data를 요청
networkService.fetchGithubProfiles(username: "onthelots") { result in
    // 4️⃣ completion이 실행됨 (해당 예시는 응답타입에 따라 다르게 처리를 실시)
    switch result {
    case .failure(let error) :
        print("에러코드 : \(error)")
    case .success(let profiles) :
        print("출력결과 : \(profiles)")
    }
}


/*
 작업순서
 1. networkService 객체의 fetchGithubProfiles(username:completion:)을 호출
 2. fetchGithubProfiles 함수에 의해 data, response, error 처리 후 decoding 하여 데이터를 할당받아옴
 3. decoding 작업이 완료된 후 -> completion을 호출함
 4. 다시 networkService 객체 실행단계로 넘어와, colmpletion이 실행됨
 */

//: [Next](@next)
