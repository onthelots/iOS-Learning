//: [Previous](@previous)

import Foundation
import Combine

// MARK: - 해야 할 일, 데이터 구조
/*
 [✅] Url 모델 객체(Model) 생성하기
 [  ] API 호출 네트워크 객체 만들기 (+Combine)
 [  ] 출력정보를 선택, 데이터 파싱하기
 */


// MARK: - Model
// App은, 아래 Result 구조체를 map 함수로 변환하여 새로운 container로 변환하는 구조네.
//struct App: Decodable {
//    let name: String
//    let category: String
//    let description: String
//    let appIcon60: String
//    let appIcon100: String
//    let appIcon512: String
//}

struct App {
    let name: String
    let category: String
    let description: String
    let appIcon60: String
    let appIcon100: String
    let appIcon512: String
}

struct Results: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let description: String
    let artworkUrl60, artworkUrl512, artworkUrl100: String
}

// MARK: - Error
// error 타입
enum NetworkError: Error {
  case invalidRequest
  case transportError(Error)
  case responseError(statusCode: Int)
  case noData
  case decodingError(Error)
}


// MARK: - Model

// 1. URLSessionConfiguration : POST 데이터를 어떻게 저장할까?
let configuration = URLSessionConfiguration.default

// 2. URL: API 정보를 받아올 URL 주소(되도록, URL 타입으로 가져오장)
// URL 자체에 대한 에러 핸들링은 추후 진행할 예정이므로, 여기선 강제 옵셔널 해제를 해주자.
let url = URL(string: "https://itunes.apple.com/search?media=software&entity=software&term=Books&country=kr&lang=ko_kr&limit=3")!

// 3.URLSession : 받아온 데이터를 활용할 객체
let session = URLSession(configuration: configuration)

// 4. URLSessionTask : 저장방식(configuration), URL, 활용할 객체(URLSession)까지 완료되었으니, 실제 작업(Task)를 정의해야 함
// dataTask : 데이터 정보를 서버에서 받아오는 작업 👆🏻 요걸 주로 진행하겠지?
// uploadTask : 데이터를 서버에 업로드 하는 작업
// downloadTask : dataTask를 디스크에 저장하는 작업

// session 객체의 데이터 정보를 받아오기 위해(dataTask) url과 data, response, error를 설정
let task = session.dataTask(with: url) { data, response, error in
    
    // 4-1. Response (객체로 생성한 URLSession이 유효한 url인가?)
    // HTTPURLResponse 타입이고, 200부터 300사이(정상)에서 statusCode를 보인다면 OK
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print("Response: \(response)")
        return
    }
    
    // 4-2. Data (객체의 데이터는 유효한가?)
    guard let data = data else { return }
    
    
    // 4-3. Error
    // 4-3-1. do-try-catch 구문
    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // 날짜 타입 설정
        let results = try decoder.decode(Results.self, from: data)
        let apps = results.results.map { app in
            App(name: app.trackName,
                category: app.primaryGenreName,
                description: app.description,
                appIcon60: app.artworkUrl60,
                appIcon100: app.artworkUrl100,
                appIcon512: app.artworkUrl512)
        }
        for app in apps {
            print(app.name)
        }
    } catch let error as NSError {
        print("Error : \(error)")
    }
}
task.resume()

        
        
    
//: [Next](@next)
