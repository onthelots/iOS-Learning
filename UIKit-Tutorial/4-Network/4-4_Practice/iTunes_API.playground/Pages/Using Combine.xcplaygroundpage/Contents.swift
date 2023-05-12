//: [Previous](@previous)

import Foundation
import Combine


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

// MARK: - Publisher, Subscription
// Publisher는 이미 NetworkService 내부의 session이 담당하고 있음
// Subscription만 별도로 생성 후, 데이터를 구독시키자

var subscripiton = Set<AnyCancellable>()

// MARK: - URLSession

final class NetworkService {
    
    // URLSession
    let session: URLSession
    
    // initializer Configuration
    init(configure: URLSessionConfiguration) {
        self.session = URLSession(configuration: configure)
    }
    
    func fetchAppStore(category: String, limit: Int) -> AnyPublisher<Apps, Error> {
        
        let url = URL(string: "https://itunes.apple.com/search?media=software&entity=software&term=\(category)&country=kr&lang=ko_kr&limit=\(limit)")!
        
        // return 타입이 Publisher 이므로, .dataTaskPublisher를 활용, URLSession을 Publisher로 생성하고 데이터를 할당과 에러 핸들ㄹ이을 실시
        return session
            .dataTaskPublisher(for: url)
        // tryMap 메서드를 활용, result란 response, data를 배출함으로서 session에게 올바른 데이터를 할당함
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode) else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: Apps.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

var appNames: [String] = []
let networkService = NetworkService(configure: .default)
let subscription = networkService
    .fetchAppStore(category: "Books", limit: 3)
    .receive(on: RunLoop.main)
    .sink { error in
        print("Error : \(error)")
    } receiveValue: { items in
        print("Items : \(items)")
    }



//: [Next](@next)
