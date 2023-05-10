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
struct App {
    let name: String
    let category: String
    let description: String
    let appIcon60: String
    let appIcon100: String
    let appIcon512: String
}

struct Response: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let description: String
    let artworkUrl60, artworkUrl512, artworkUrl100: String
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

//: [Next](@next)
