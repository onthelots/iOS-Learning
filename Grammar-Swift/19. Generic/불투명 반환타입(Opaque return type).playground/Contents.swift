import UIKit

// MARK: - 불투명 반환타입 == 역 제너릭 타입?
// 기존의 제너릭(Generic)의 경우, 1.함수를 호출하거나, 2. 인스턴스를 생성할 때 구체적인 타입을 결정함
// 아래와 같이 기본적인 예시코드를 보자면..

// where 절을 활용해서 프로토콜을 채택할 수 있다!
func isEqual<T>(a: inout T, b: inout T) -> Bool where T: Equatable {
    return a == b
}

// 위 코드에서는, isEqual이란 함수 내부의 a, b의 매개변수가 어떤 타입인지 불분명함!
// 이를 결정하는 것이, 바로 함수를 호출하는 '외부' 였음

var intA: Int = 5
var intB: Int = 10

isEqual(a: &intA, b: &intB) // 잘 작동하는 동시에, T는 Int란 타입으로 결정됨


// 그렇다면, 이러한 제너릭 타입의 반대인 '불투명 타입'은 어떤 특징을 가지고 있을까?
// 정확히 반대로 -> 내부에서는 타입을 알고 있으며, 외부에서는 타입을 알 수 없다는 특징을 가지고 있지 않을까? 역할의 반전!
// 추가적인 예시코드를 살펴보자면..

// 한 회사에서 RamdomBox란 프로토콜을 만들고, 내부에 Gift란 상품을 Random한 타입으로 설정하고자 함
protocol RandomBox {
    func message() -> String
}

// 생산파트에서는 해당 gift를 RandomBox 프로토콜 규칙에 의해 만들고자 함

// 1. IPadGift는 RandomBox를 준수하게 됩니다.
struct IPadGift: RandomBox {
    func message() -> String {
        return "축하드립니다! IPad에 당첨되셨습니다."
    }
}

// 2. PensilGift
struct PensilGift: RandomBox {
    func message() -> String {
        return "최고급 연필입니다!"
    }
}

func makeGift() -> RandomBox {
    return IPadGift()
}

let gift = makeGift()
print(gift.message())
