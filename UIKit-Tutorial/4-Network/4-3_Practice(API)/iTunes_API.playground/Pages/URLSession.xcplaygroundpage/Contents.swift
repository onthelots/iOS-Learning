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
// App은, 아래 Result 구조체를 map 함수로 변환하여 새로운 container로 변환하는 구조네.
//struct App {
//    let name: String
//    let category: String
//    let description: String
//    let appIcon60: String
//    let appIcon100: String
//    let appIcon512: String
//}

struct Response: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let trackName: String
    let primaryGenreName: String
    let description: String
    let artworkUrl60, artworkUrl512, artworkUrl100: String
}

// MARK: - NetworkService
let urlString = "https://itunes.apple.com/search?media=software&entity=software&term=Books&country=kr&lang=ko_kr&limit=3"

if let url = URL(string: urlString) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
            } catch let error {
                print(error)
            }
        }
    }.resume()
}
//: [Next](@next)
