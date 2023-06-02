//: [Previous](@previous)

import Foundation
import Combine

// MARK: - iTunes_API를 활용, 어플리케이션 종류 중, 카테고리 3개 중, limit 3개까지 뽑아 아래와 같은 정보를 출력해보자.
/*
  - 출력정보 :  카테고리명, 앱 아이콘 이미지(url), 앱 이름, 앱 정보, 평점
  - API 호출을 위한 URL
    - limit : https://itunes.apple.com/search?media=software&entity=software&term={카테고리}&country={국가}&lang={언어코드}&limit={최대 가져올 갯수}
    - offset : https://itunes.apple.com/search?media=software&entity=software&term={카테고리}&country={국가}&lang={언어코드}&offset={건너띌 항목의 개수}
    - 여기서, { 괄호 }는 임의로 입력이 필요함
    - (limit) 최대 가져올 개수 : 앱 데이터 파싱 갯수
    - (offset)건너띌 항목의 개수 : 특정 갯수 x 까지의 앱 개수(100개 단위)를 제외한 이후 100개의 갯수를 나타냄 (예로, 100을 입력하게 되면 1~100까지는 제외되고 101부터 200까지)
    - 국가 : 한국(kr) / - 언어코드 : 한국(ko_kr)
    - 카테고리 종류 : Books, Business, Education, Entertainment, Finance, Food & Drink, Games, Health & Fitness, Lifestyle, Medical, Music, Navigation, News, Photo & Video, Productivity, Reference, Social Networking, Sports, Travel, Utilities, Weather
 */


// MARK: - 해야 할 일, 데이터 구조
/*
 [✅] Url 모델 객체(Model) 생성하기
 [  ] API 호출 네트워크 객체 만들기 (+Combine)
 [  ] 출력정보를 선택, 데이터 파싱하기
 */

// MARK: - Model
//struct App {
//    let name: String
//    let category: String
//    let description: String
//    let appIcon60: String
//    let appIcon100: String
//    let appIcon512: String
//}

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


// MARK: - Fetch method를 활용한 API Parsing 및 Decoding
// NetworkServerirce 클래스 모델을 생성한 후, fetch method 내부에서 task 업무를 담당함

final class NetworkService {
    
    let session: URLSession
    
    init(configure: URLSessionConfiguration) {
        self.session = URLSession(configuration: configure)
    }
    
    func fetchAppInfomation(category: String, limit: Int, completion : @escaping (Result<Apps, Error>) -> Void) {
        
        let url = URL(string: "https://itunes.apple.com/search?media=software&entity=software&term=\(category)&country=kr&lang=ko_kr&limit=\(limit)")!
        
        let task = session.dataTask(with: url) { data, response, error in
        
            
            // Error -> @escaping closure 활용
            // completion 매개변수를 가지는 .
            if let error = error {
                completion(.failure(NetworkError.transportError(error)))
                return
            }
            
            // Response
            if let httpResponse = response as? HTTPURLResponse,
               !(200..<300).contains(httpResponse.statusCode) {
                completion(.failure(NetworkError.responseError(statusCode: httpResponse.statusCode)))
                return
            }
            
            // data
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            // Decoding
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // 날짜 타입 설정
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let apps = try decoder.decode(Apps.self, from: data)
                completion(.success(apps))
            } catch let error {
                completion(.failure(NetworkError.decodingError(error)))
            }
        }
        task.resume()
    }
}

let networkService = NetworkService(configure: .default)

networkService.fetchAppInfomation(category: "Books", limit: 3) { result in
    
    switch result {
    case .failure(let error) :
        print("Error : \(error)")
    case .success(let apps) :
        print("Success : \(apps)")
    }
}



//: [Next](@next)
