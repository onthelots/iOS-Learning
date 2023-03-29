//: [Previous](@previous)

import Foundation
import Combine

// MARK: - Subscription (구독 티켓!)
// 퍼블리셔와 구독자(Subscribe)간의 관계를 형성하는 방식

// 퍼블리셔 subject 선언
let subject = PassthroughSubject<String, Never>()


// 구독관계 형성
let subscription = subject
    .print("[Debug]") // Debug용 print
    .sink { value in
    print("구독자는 다음 값을 제공 받는다 : \(value)")
}

// 데이터를 아래와 같이 3개를 먼저 보내고,
subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")

// 구독자 또한 관계를 끊을 수 있는 메서드가 있음(cancel())
subscription.cancel()

// completion(.finished)를 통해 구독관계를 끊어버린다면?
//subject.send(completion: .finished)

// 여기 아래 send 메서드는 수행할 수 있을까..?
subject.send("Hello?")

/*
 receive subscription: (PassthroughSubject)
 request unlimited
 // 1. 첫번째 데이터
  - receive value: (Hello)
  - 구독자는 다음 값을 제공 받는다 : Hello
 // 2. 첫번째 데이터
  - receive value: (Hello again!)
  - 구독자는 다음 값을 제공 받는다 : Hello again!
 // 3. 첫번째 데이터
  - receive value: (Hello for the last time!)
  - 구독자는 다음 값을 제공 받는다 : Hello for the last time!
 // 4. 구독관계가 끝나게 됨
  - receive finished 혹은 receive cancel
 // 구독 관계를 종료한 후, 전송된 데이터는 받질 않는다.
 */


//: [Next](@next)
