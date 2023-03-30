//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
/*
 1. Publisher -> Output과 Error 타입을 제공해야 함
 - Built-in : Just(값 타입), Future(메서드 타입)
 2. SubScriber -> Input과 Failure 두 타입을 정의해야 함
 - Built-in : assign(특정 키패스에 할당), sink(데이터를 제공받을 수 있도록 클로저를 제공)
 */


// MARK: - Just (Publisher 빌트인, 값을 저장함)
// Just는 일종의 output 타입임
let justPublisher = Just(1000)

// MARK: - sink (Publisher가 제공하는 값을 Subscriber가 받아올 수 있는 메서드를 제공함)
let subscription1 = justPublisher
    .sink { value in
        print("퍼블리셔에게 제공받은 값은? : \(value)")
    }
// 퍼블리셔에게 제공받은 값은? : 1000
// sink를 사용, 퍼블리셔의 데이터를 제공받음


// MARK: - Custom Publisher 1 (Publisher 만들기)
// 초기값 뒤에 .publisher를 붙이게 되면? -> 해당 변수는 퍼블리셔가 됨! (타입은 Publishers.Sequence<[Int], Never>)
let arrayPublisher = [1, 3, 5, 7, 9].publisher

let subscription2 = arrayPublisher
    .sink { value in
        print("퍼블리셔에게 제공받은 값은? : \(value)")
    }
/*
 퍼블리셔에게 제공받은 값은? : 1
 퍼블리셔에게 제공받은 값은? : 3
 퍼블리셔에게 제공받은 값은? : 5
 퍼블리셔에게 제공받은 값은? : 7
 퍼블리셔에게 제공받은 값은? : 9
 */


// MARK: - Assign 활용
// Assign이란? : 특정 객체의 키패스, 즉 다수의 객체가 존재할 경우 특정 객체만 가져올 수 있는 방식
// 정리하자면, Assign은 publisher로 부터 받은 값을, 주어진 instance의 property에 할당할 수 있도록 함!
// sink는 단순히 publisher의 값을 구독해 온다면, Assign은 인스턴스 프로퍼티의 값으로서 할당할 수 있게 해준다는!

// value라는 프로퍼티를 가지고 있는 MyClass()
class MyClass {
    var value: Int = 0 {
        didSet {
            print("프로퍼티의 값은? :  \(value)")
        }
    }
}

// object라는 클래스 인스턴스를 생성하게 되면..
let object = MyClass()

// 위에서 선언한 arrayPublisher(퍼블리셔)에 assing 빌트인을 통해 Object 인스턴스의 value값에 저장함
let subscription3 = arrayPublisher
    .assign(to: \.value, on: object) // assign은 일종의 키패스, 즉 object 인스턴스에 포함된 value를 구독 티켓으로 가져옴 (\.value가 바로 키패스)

/*
 프로퍼티의 값은? :  1
 프로퍼티의 값은? :  3
 프로퍼티의 값은? :  5
 프로퍼티의 값은? :  7
 프로퍼티의 값은? :  9
 */

print("Final Value : \(object.value)") // Final Value : 9

// 여기까지 참고
// https://sujinnaljin.medium.com/combine-sink-assign-3dc04b7b326f



//: [Next](@next)


