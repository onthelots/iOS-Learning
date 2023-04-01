//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
  case invalidRequest
  case transportError(Error)
  case responseError(statusCode: Int)
  case noData
  case decodingError(Error)
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

// MARK: - NetworkService

final class NetworkService {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    // Result? -> Enum 타입으로, <Sucess, Failure> case를 가지고 있음
    func fetchProfile(username: String, completion: @escaping (Result<GithubProfile, Error>)-> Void) {
        let url = URL(string: "https://api.github.com/users/\(username)")!

        let task = session.dataTask(with: url) { data, response, error in
            
            // errorhandling -> transportError
            if let error = error {
                completion(.failure(NetworkError.transportError(error)))
                return
            }
            
            // Response
            if let httpResponse = response as? HTTPURLResponse,
               (200..<300).contains(httpResponse.statusCode) {
                completion(.failure(NetworkError.responseError(statusCode: httpResponse.statusCode)))
            }
            
            // data
            guard let data = data else { return }
            
            // decoding!
            // data -> GithubProfile (Decoding)
            // do-try-catch 구문을 활용 (Errorhandling)
            do {
                // decorder(디코딩을 하는 기능을 담은 주체) = JSONDecorder()
                let decorder = JSONDecoder()
                
                // 실제 Model의 데이터로 가져오기 위해 'try'함
                // decode(Model 데이터, from: 서버 데이터)
                let profile = try decorder.decode(GithubProfile.self, from: data)
                print("profiles: \(profile)")
            } catch let error as NSError {
                print("error : \(error)")
            }
        }
    }
}







//: [Next](@next)
