import UIKit

// MARK: - some View? 불투명 반환타입
// SwiftUI 프로젝트를 생성하게 되면, 구조체로 선언되었으며, View 프로토콜을 채택한 ContentView를 볼 수 있으며,
// body 메서드는 이상한 'some View'라는 타입을 가지고 있는 것을 볼 수 있다.
// 여기서 some 키워드가 바로 반환되는 타입을 -> 불투명 반환 타입으로 만들어 주는 용도로 활용된다.
// 따라서, some View에 대해 알아보기 전에 '불투명 반환 타입'이 무엇인지 살펴보자.


// MARK: - 제네릭 타입 (Generic Type)
// some view, 불투명 반환타입을 알아보고 있는데, 왜 때문에 '제네릭' ?
// 불투명 반환타입은 다른말로 '역 제네릭 타입'이라고 함 -> 그렇기 때문에, 제너릭에 대한 사전 학습이 필요함!

// Array, Dictionary 등 Swift 표준 라이브러리의 대다수가 이러한 제너릭으로 선언되어 있음
// 기초적인 형태를 살펴보면.. 다음과 같음 (두 매개변수의 값을 바꾸는 - Swap 함수를 만든다면?)


// -- 코드 예시 : 매개변수 a와 b의 값을 전환하는 함수 'swapInts'
//func swapInts(_ a: inout Int, _ b: inout Int) {
//
//    let tempA = a // 섀도우 변수 tempA에 매개변수 a를 할당하고,
//    a = b // 매개변수 a에는 매개변수 b를 할당하고,
//    b = tempA // 매개변수 b는 섀도우 변수 a를 할당한다
//
//    // 그렇게 되면, a와 b는 값이 서로 Swap 될 것임
//}
//var a = 12
//var b = 20
//swapInts(&a, &b) // 정상적으로 잘 작동!

// 하지만, 정수형 이외 문자 및 Double 타입 또한 동일한 함수를 만들어 주고 싶다면..
// '오버로딩'을 통해 매개변수의 타입만 다른 함수를 만들어 주어야 했음 -> 귀찮
// 이럴때, "어떤 타입이 와도, 활용할 수 있는 함수를 만들 수 없을까?"란 질문을 던질 수 있음
// 여기서 활용하는 것이 바로 '제네릭' 타입임

// 꺽쇠<>를 활용, 일종의 새로운 '타입'처럼 활용할 수 있는 이름(T)를 선언해주고,
// 새롭게 생성된 타입, 'T'를 매개변수의 타입으로 대체함 (plceholder!)

func genericSwap<T> (_ a : inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var number1 = 5
var number2 = 10

genericSwap(&number1, &number2)



var string1 = "Lime"
var string2 = "Jason"

genericSwap(&string1, &string2)

string1 // Jason
string2 // Lime

// MARK: - 불투명 반환타입(opaque return type)

// plusFunc1 이란 함수는 오버로딩 되었으니 에러가 안날테고..
// 반환하는 타입이 some 키워드와 함께 Equatable이란 프로토콜 타입을 반환하고 있음
// 여기서의 'some' 의 용도는 즉, 특정 프로토콜을 따르는(채택한) 모든 타입의 결과가 반환되는 것이라고 여김


