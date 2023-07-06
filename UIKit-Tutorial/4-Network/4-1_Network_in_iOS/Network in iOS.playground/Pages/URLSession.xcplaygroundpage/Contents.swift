//: [Previous](@previous)

import Foundation

// MARK: - URLSession
// iOS에서 서버와 소통하는 방식

// MARK: - URLSessionConfiguration (저장)
// .default : 디스크를 이용한 정보저장 (Browser를 띄울 때)
// .ephemeral : 쿠키, 인증서 등의 정보는 저장하지 않음 (일종의 시크릿 모드)
// .background : 네트워크를 통해 파일을 받을 시, 백그라운드에서 다운로드를 실행

let configuration = URLSessionConfiguration.default

// MARK: - URLSession (객체만들기)
// iOS에서 서버 받아오고, 저장하고, 객체를 만들어 주는 가장 중요한 주체

let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/onthelots")!


// MARK: - URLSessionTask (작업)
// dataTask : 데이터 정보를 서버에서 받아오는 작업
// uploadTask : 데이터를 서버에 업로드하는 작업
// downloadTask : dataTask를 디스크에 저장하는 작업

let task = session.dataTask(with: url) { data, response, error in // 요청한 데이터 : data, 서버로부터의 응답 : response, 에러 : error
    // response부터 확인해보자면..
    // 해당 타입은 HTTPURLResponse로 타입 캐스팅하는 동시에, response의 값이 200대이며, statusCode를 담고 있다면 scpoe를 넘어가게 됨

    // 1. Response (객체로 생성한 URLSession이 유효한가?)
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print(">> Response : \(String(describing: response))")
        return
    }

    // 2. Data (객체의 데이터는 유효한가?)
    // data 또한 바인딩이 필요함 (옵셔널 타입이므로)
    guard let data = data else { return }

    // 해당 data의 결과(result)를 String으로 interpolation 하는 동시에, utf8 형식으로 저장하고
    let result = String(data: data, encoding: .utf8)
    print(result)
}

// dataTask : 데이터의 정보를 서버에서 받아오는 작업 (Decoding)
// uploadTask : 데이터를 서버에 업로드 하는 작업 (Encoding)


// data를 정상적으로 출력하기 위한 resume()
task.resume()


// MARK: - Codable
// 네트워크 요청을 통해 받아온 데이터를 swift 객체로 인코딩/디코딩 가능하게 하는 타입
// 네트워크 응답 형태로, JSON을 보통 표준으로 활용
// Codable을 활용한다면, JSON <-> Swift 객체 간 전환이 쉬움


// MARK: - URLSeession + Combine
// URLSessionDataTask에 대한 '퍼블리셔'를 제공
// 따라서, 비동기 응답에 대한 작업이 더 수월하게 됨



//: [Next](@next)
