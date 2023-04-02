//: [Previous](@previous)

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case responseError(statusCode: Int)
}

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

// NetworkService
final class NetworkService {
    // URLSession
    let session: URLSession
    
    // URLConfigure 초기화
    init(configure: URLSessionConfiguration) {
        session = URLSession(configuration: configure)
    }
    
    // Combine화 (기존에 Result타입이 아닌, AnyPublisher를 반환하는 형태로 작성)
    func fetchProfiles(username: String) -> AnyPublisher<GithubProfile, Error> {
        // url 주소를 인자로 받아오기 위해 파라미터 설정
        let url = URL(string: "https://api.github.com/users/\(username)")!
        
        // MARK: - dataTaskPublisher 생성
        let publisher = session
            .dataTaskPublisher(for: url)
        
        // result -> data, Response 2가지가 있음
        // 2. Response / data
            .tryMap { result -> Data in
                guard let httpResponse = result.response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1 // statusCode가 없으면?
                    // 3. error
                    throw NetworkError.responseError(statusCode: statusCode) // Error를 throw
                }
                return result.data
            }
        
            // 4. decoding
            .decode(type: GithubProfile.self, decoder: JSONDecoder())
            
            // 기타. 타입을 지운뒤 반환하는 형태 -> 퍼블리셔를 만드는 과정(혹은 파이프라인)을 외부로부터 숨기고, 최종적인 형태의 퍼블리셔만을 리턴할 수 있도록
            .eraseToAnyPublisher() // 타입을 지우는 역할
        
        return publisher
    }
}

// 퍼블리셔가 되며,
let networkService = NetworkService(configure: .default)

// 아래 subscription으로 할당할 수 있음
let subscription = networkService
    .fetchProfiles(username: "onthelots")
    .receive(on: RunLoop.main)
    .sink { completion in
        print("completion : \(completion)")
    } receiveValue: { profile in
        print("profile: \(profile)")
    }






//: [Next](@next)



