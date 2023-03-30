import Foundation
import Combine

// MARK: - Subject


// MARK: - 1. PassthroughSubject
// 구독자에게 바로 데이터를 전송하며, 본인은 남기지 않음
// Output 타입과 Error 타입을 결정해야 함

// 퍼블리셔 relay 선언
let relay = PassthroughSubject<String, Never>()

// 구독자 선언 (sink)
let subscription1 = relay.sink { value in
    print("subscription1 receive value: \(value)")
}

// 퍼블리셔 relayd에서 'send'를 통해 데이터를 전송
relay.send("Hello")
relay.send("World!")
/*
 subscription1 receive value: Hello
 subscription1 receive value: World!
 */


// MARK: - 2. CurrentValueSubject
// Output 타입에 대한 초기값이 반드시 필요함

let variable = CurrentValueSubject<String, Never>("")

variable.send("Initial Text") // 요렇게, 구독을 하기 전에 미리 데이터를 가지고 있을 수 있음! 즉, 기존 데이터 또한 함께 보냄

let subscription2 = variable.sink { value in
    print("subscription1 receive value: \(value)")
}

variable.send("More text")
/*
 // 기존에 가지고 있던 Value를 먼저 보내고, 이어서 전송함
 subscription1 receive value:
 subscription1 receive value: More text
 */

variable.value // "More text" (보냈던 데이터, 즉 묻혀진 데이터를 가지고 있음)



// MARK: - 퍼블리셔가 미리 데이터를 가지고 있으며, 다른 퍼블리셔에게 데이터를 전달한다면?
let publisher = ["Here", "we", "go"].publisher
publisher.subscribe(relay)
// relay에게 전달된 데이터
/*
 subscription1 receive value: Here
 subscription1 receive value: we
 subscription1 receive value: go
 */
