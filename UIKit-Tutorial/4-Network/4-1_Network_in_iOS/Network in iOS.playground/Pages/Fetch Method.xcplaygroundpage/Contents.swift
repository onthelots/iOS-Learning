//: [Previous](@previous)

import Foundation


// error 타입
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
    func fetchGithubProfiles(username: String, completeion: @escaping (Result<GithubProfile, Error>) -> Void) {
        
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

networkService.fetchGithubProfiles(username: "onthelots") { result in
    switch result {
    case .failure(let error) :
        print("에러코드 : \(error)")
    case .success(let profiles) :
        print("출력결과 : \(profiles)")
    }
}






//// MARK: - NetworkService
//final class NetworkService {
//    // URLSession
//    let session: URLSession
//
//    // URLConfigure 초기화
//    init(configure: URLSessionConfiguration) {
//        session = URLSession(configuration: configure)
//    }
//
//    // URLSessionTask -> Decoding 작업 (fetchProfiles)
//    // completion -> ErrorHandling을 위해, @escaping 클로저 값을 파라미터로 설정함 (Result는 'Enum'으로 선언된 제네릭 타입이며, 성공과 실패에 대한 결과값을 반환함)
//    func fetchProfiles(username: String, completion: @escaping(Result<GithubProfile, Error>)-> Void) {
//        // url 주소를 인자로 받아오기 위해 파라미터 설정
//        let url = URL(string: "https://api.github.com/users/\(username)")!
//
//        // Task 실행
//        let task = session.dataTask(with: url) { data, response, error in
//
//            // error hanlding
//            // transportError
//            if let error = error {
//                completion(.failure(NetworkError.transportError(error)))
//                return
//            }
//
//
//            // response -> responseError (statusCode)
//            if let response = response as? HTTPURLResponse, !(200..<300).contains(response.statusCode) {
//                completion(.failure(NetworkError.responseError(statusCode: response.statusCode)))
//                return
//            }
//
//
//            // data (noData)
//            guard let data = data else {
//                completion(.failure(NetworkError.noData))
//                return
//            }
//
//            // error handling -> decoding
//            do {
//                let decoder = JSONDecoder()
//                let profile = try decoder.decode(GithubProfile.self, from: data)
//                completion(.success(profile))
//            } catch let error {
//                completion(.failure(NetworkError.decodingError(error)))
//            }
//        }
//        task.resume() // task 실행 메서드
//    }
//}
//
//// 객체 만들기
//// URLConfigure (초기값 설정해주고..)
//let networkService = NetworkService(configure: .default)
//
//networkService.fetchProfiles(username: "onthelots") { result in
//    switch result {
//    case .success(let profile):
//        print("성공 : \(profile)")
//    case .failure(let error):
//        print("실패 : \(error as NSError)")
//    }
//}
//
//
////: [Next](@next)
