//: [Previous](@previous)

import Foundation
import Combine
import UIKit

// MARK: - Publisher (iOS에서 자동으로 제공하는 퍼블리셔)

// MARK: - 1. URLSessionTask Publisher and JSON Decoding Operator

struct SomeDecodable : Decodable { }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.naver.com")!)
    .map { data, response in
        return data
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder()) // 앱 내 객체형으로 바꿈



// MARK: - 2. Notifications

let center = NotificationCenter.default
let noti = Notification.Name("MyNoti")
let notiPublisher = center.publisher(for: noti, object: nil)

let subscription1 = notiPublisher.sink { _ in
    print("Noti Received")
}

center.post(name: noti, object: nil)



// MARK: - 3. KeyPath binding to NSObject instances

let ageLabel = UILabel()
print("text: \(ageLabel.text)")

Just(28)
    .map { "Age is \($0)"}
    .assign(to: \.text, on: ageLabel)
print("text : \(ageLabel.text)")



// MARK: - 4. Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함
let timerPublisher = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect() // 특정 객체가 구독하면, 알아서 시작해라

let subscription2 = timerPublisher.sink { time in
    print("time : \(time)")
}

// 5초뒤에 정지
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription2.cancel()
}


//subscription2.cancel()



//: [Next](@next)
