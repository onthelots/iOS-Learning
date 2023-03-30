//: [Previous](@previous)

import Foundation
import Combine

// MARK: - Scheduler
// 언제, 어떻게 클로저를 실행해야 하나?
// Operator가 이러한 기능을 담당하는데, Scheduler라는 파라미터를 통해 해당 작업을 실시하는 경우가 있음
// 즉, 백그라운드 혹은 메인스레드에서 언제 작업을 실시할껀데? 라는 의문을 오퍼레이터인 Scheduler가 담당함

// 1. subscribe(on:) 을 이용해서, publisher 가 어느 스레드에서 수행할지 결정해주는것
// 2. receive(on:) 을 이용해서 operator, subscriber 가 어느 스레드에서 수행할지 결정해주는것

let arrPublisher = [1, 2, 3].publisher

// MARK: - GCD, DispatchQueue (추후 자세하게 알아보자)
// DispatchQueue : GCD 라이브러리, 동시성 프로그래밍을 지원하는 쓰레드 처리 방식
// Attribute(처리방식) : serial(순차적 처리, 디폴트 세팅), concurrent(병렬적 처리)
// Sync/Async(작업의 특성) : Sync(동기성 작업, 작업1 -> 작업2), Async(비동기 작업, 작업1,2)
// Queue(종류) : Main Queue(메인스레드에서 작업을 실시하며, 동기성 프로그램과 함께 사용이 불가능함), Global(분산되어 처리)

let customQueue = DispatchQueue(label: "custom") // queue는, DispatchQueue이며, custom이란 이름의 Custom queue를 선언함

// 구독티켓은 -> 위에 선언한 생산자 배열 arrPublisher이 제공(sink)하며, 해당 value와 현재 thread를 나타냄

let subscription = arrPublisher
    .sink { value in
        print("구독된 값은 : \(value), 작업중인 쓰레드는? : \(Thread.current)")
    }

/*
 // 메인 쓰레드에서 돌아가네?
 구독된 값은 : 1, 작업중인 쓰레드는? : <_NSMainThread: 0x6000006781c0>{number = 1, name = main}
 구독된 값은 : 2, 작업중인 쓰레드는? : <_NSMainThread: 0x6000006781c0>{number = 1, name = main}
 구독된 값은 : 3, 작업중인 쓰레드는? : <_NSMainThread: 0x6000006781c0>{number = 1, name = main}
 */


// MARK: - 어느 쓰레드에서 작업할 것인가? -> Operator
// 앞서 살펴본 Scheduler는 쓰레드를 지정해주는데,
// 크게 subscribe(on:)은 퍼블리셔가 작업하는 쓰레드를, receive(on:)은 오퍼레이터와 구독자가 작업하는 쓰레드를 결정해줌

let subscription3 = arrPublisher
    .subscribe(on: customQueue) // Pulisher가 어느 쓰레드에서 수행할것인가?
    .map({ value in
        print("transform: \(value), thread : \(Thread.current)")
        return value
    })
    .receive(on: DispatchQueue.main) // operator와 subscriber가 어느 쓰레드에서 수행할 것인가?
    .sink { value in
    print("Receive Value : \(value), thread: \(Thread.current)")
}

/*
 transform: 1, thread : <NSThread: 0x6000039bcd00>{number = 8, name = (null)}
 transform: 2, thread : <NSThread: 0x6000039bcd00>{number = 8, name = (null)}
 transform: 3, thread : <NSThread: 0x6000039bcd00>{number = 8, name = (null)}
 Receive Value : 1, thread: <_NSMainThread: 0x6000039b01c0>{number = 1, name = main}
 Receive Value : 2, thread: <_NSMainThread: 0x6000039b01c0>{number = 1, name = main}
 Receive Value : 3, thread: <_NSMainThread: 0x6000039b01c0>{number = 1, name = main}
 */

//: [Next](@next)
