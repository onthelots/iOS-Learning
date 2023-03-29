import UIKit

// MARK: - 제네릭 함수 (Generic function)
// some view, 불투명 반환타입을 알아보고 있는데, 왜 때문에 '제네릭' ?
// 불투명 반환타입은 다른말로 '역 제네릭 타입'이라고 함 -> 그렇기 때문에, 제너릭에 대한 사전 학습이 필요함!

// Array, Dictionary 등 Swift 표준 라이브러리의 대다수가 이러한 제너릭으로 선언되어 있음
// 기초적인 형태를 살펴보면.. 다음과 같음 (두 매개변수의 값을 바꾸는 - Swap 함수를 만든다면?)


// -- 코드 예시 : 매개변수 a와 b의 값을 전환하는 함수 'swapInts'
func swap(_ a: inout Int, _ b: inout Int) {

    let tempA = a // 섀도우 변수 tempA에 매개변수 a를 할당하고,
    a = b // 매개변수 a에는 매개변수 b를 할당하고,
    b = tempA // 매개변수 b는 섀도우 변수 a를 할당한다

    // 그렇게 되면, a와 b는 값이 서로 Swap 될 것임
}
var intA = 12
var intB = 20
swap(&intA, &intB) // 정상적으로 잘 작동!



// 하지만, 정수형 이외 문자 및 Double 타입 또한 동일한 함수를 만들어 주고 싶다면..
// '오버로딩'을 통해 매개변수의 타입만 다른 함수를 만들어 주어야 했음 -> 귀찮

func swap(_ a: inout String, _ b: inout String) {
    
    let tempA = a
    a = b
    b = tempA
}

var stringA = "Lime"
var stringB = "Jason"

swap(&stringA, &stringB)

stringA // "Jason"
stringB // "Lime"



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

genericSwap(&number1, &number2) // 아, 제네릭(범용)타입 T는 Int타입으로 설정되었구나!



var string1 = "Lime"
var string2 = "Jason"

genericSwap(&string1, &string2) // 아, 제네릭(범용)타입 T는 String타입으로 설정되었구나!

string1 // Jason
string2 // Lime



// MARK: - 제네릭 타입 (Generic Type)
// 위에서 살펴본 '함수'로서 활용하는 방법 이외,
// 구조체, 클래스, 열거형 등 타입에도 선언하여 활용할 수 있음! -> 이를 제네릭 타입이라고 함

struct Customer<T> {
    var number: [T] = []
    
    mutating func deleteNumber(_ names: T) {
    }
}

var order: Customer<Int> = .init()

order.number = [1,4,6]

order.number // [1,4,6]


// MARK: - 타입 제약(Type Constraints)
// 앞서 살펴본 제네릭은, 말 그대로 '모든 타입'에서 사용이 가능하다는 특징이 있었음.
// 하지만, 제네릭을 사용하는 대신 특정 타입만 사용하도록 역으로 조건을 걸 순 없을까?
// 이를 실현하기 위한 것이 바로 '타입 제약'임

// MARK: - 1. 프로토콜 제약
// 매개변수 a와 b가 동일한 경우 true, 그렇지 않을 경우 false를 반환하는 함수를 만들어 보자.
//func isEqual<T>(_ a: T, _ b: T) -> Bool {
//    return a == b // Binary operator '==' cannot be applied to two 'T' operands 오류 발생
//}

// 왜? == 란 비교연산자의 경우, a와 b 타입이 'Equtable'이란 프로토콜을 준수할 경우에만 활용이 가능함.
// 여기서 Equatbale 프로토콜은 쉽게 말해 '값이 동일한지, 어떤지 비교할 수 있는 타입'임 (대부분의 기본 데이터 타입은 해당 프로토콜을 따름)

func isEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    return a == b // Binary operator '==' cannot be applied to two 'T' operands 오류 발생
}

isEqual(5, 5) // true
isEqual(10, 1) // false


// MARK: - 2. 클래스 제약
// 프로토콜과 동일하게 활용되나, 해당 키워드에 프로토콜이 아닌 클래스 이름이 오게 됨

class Animals { }
class Human { }
class Son: Human { }

func callName<T: Human>(_  a: T) { }

var animals = Animals.init()
var human = Human.init()
var son = Son.init()

callName(animals)
callName(human)
callName(son) // Global function 'callName' requires that 'Animals' inherit from 'Human'
