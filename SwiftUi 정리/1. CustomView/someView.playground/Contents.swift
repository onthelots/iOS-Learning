import UIKit

// MARK: - some View? 불투명 반환타입
// SwiftUI 프로젝트를 생성하게 되면, 구조체로 선언되었으며, View 프로토콜을 채택한 ContentView를 볼 수 있으며,
// body 메서드는 이상한 'some View'라는 타입을 가지고 있는 것을 볼 수 있다.
// 여기서 some 키워드가 바로 반환되는 타입을 -> 불투명 반환 타입으로 만들어 주는 용도로 활용된다.
// 따라서, some View에 대해 알아보기 전에 '불투명 반환 타입'이 무엇인지 살펴보자.


// MARK: - 불투명 반환타입(opaque return type)

// 우선 아래와 같은 예시 코드를 살펴보자.

// plusFunc1이란 함수는, 정수형 결과를 반환하도록 구성되어 있다.
func plusFunc1(count: Int) -> Int {
    return count + 1
}

// 여기서 정수형 반환 타입을 바로 구체화된 타입(concrete type)이라고 하며,
// 하지만, 아래와 같이 작성할 수도 있음

func plusFunc1(count: Int) -> some Equatable {
    return count + 1
}

// plusFunc1 이란 함수는 오버로딩 되었으니 에러가 안날테고..
// 반환하는 타입이 some 키워드와 함께 Equatable이란 프로토콜 타입을 반환하고 있음
// 여기서의 'some' 의 용도는 즉, 특정 프로토콜을 따르는(채택한) 모든 타입의 결과가 반환되는 것이라고 여김


