//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
// MARK: - Just (Publisher 빌트인, 값을 저장함)
let justPublisher = Just(1000)

// MARK: - sink (Publisher가 제공하는 값을 Subscriber가 받아올 수 있는 메서드를 제공함)
let subscription1 = justPublisher.sink { value in
    print("Received Value: \(value)")
}

// Received Value: 1000

// MARK: - Custom Publisher 1 (Publisher 만들기)
let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received Value: \(value)")
}

/*
 Received Value: 1
 Received Value: 3
 Received Value: 5
 Received Value: 7
 Received Value: 9
 */


// MARK: - Assign 활용
// Assign이란? : 특정 객체의 키패스, 즉 다수의 객체가 존재할 경우 특정 객체만 가져올 수 있는 방식
// 정리하자면, Assign은 publisher로 부터 받은 값을, 주어진 instance의 property에 할당할 수 있도록 함!
// sink는 단순히 publisher의 값을 구독해 온다면, Assign은 인스턴스 프로퍼티의 값으로서 할당할 수 있게 해준다는!

class MyClass {
    var value: Int = 0 {
        didSet {
            print("Did set property to \(value)")
        }
    }
}

let object = MyClass()
let subscription4 = arrayPublisher.assign(to: \.value, on: object)
// value(프로퍼티)에 값을 할당할거고, 그 프로퍼티가 있는 클래스 인스턴스는 object이다~

/*
 Did set property to 1
 Did set property to 3
 Did set property to 5
 Did set property to 7
 Did set property to 9
 */

print("Final Value : \(object.value)") // Final Value : 9

// 여기까지 참고
// https://sujinnaljin.medium.com/combine-sink-assign-3dc04b7b326f



//: [Next](@next)


