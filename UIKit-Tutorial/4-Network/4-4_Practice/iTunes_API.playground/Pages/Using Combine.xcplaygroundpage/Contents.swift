//: [Previous](@previous)

import Foundation


// MARK: - Model
struct Apps: Codable {
    let apps: [AppInfo]

    enum CodingKeys: String, CodingKey {
        case apps = "results" // results란 명칭의 키가 존재하기 때문에, 속성 이름은 바꾸지 않거나, CodingKeys를 활용해 맞춰줘야 함
    }
}

struct AppInfo: Codable {
    let trackName: String
    let primaryGenreName: String
    let description: String
    let artworkUrl60, artworkUrl512, artworkUrl100: String
}

// MARK: - Error 타입
enum NetworkError: Error {
  case invalidRequest
  case transportError(Error)
  case responseError(statusCode: Int)
  case noData
  case decodingError(Error)
}

// MARK: - URLSession

final class NetworkService {
    
    // URLSession
    let session: URLSession
    
    // initializer Configuration
    init(configure: URLSessionConfiguration) {
        self.session = URLSession(configuration: configure)
    }
    
    func fetchAppStore(category: String, limit: Int, completion: @escaping (Result<Apps, Error>) -> Void) {
        
        let url = URL(string: "https://itunes.apple.com/search?media=software&entity=software&term=\(category)&country=kr&lang=ko_kr&limit=\(limit)")!
        
        let task = session.dataTask(with: url) { data, response, error in
            <#code#>
        }
    }
}



//: [Next](@next)