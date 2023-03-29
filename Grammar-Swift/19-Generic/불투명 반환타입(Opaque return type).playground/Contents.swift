import UIKit
import SwiftUI

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
// 예시코드를 살펴보자면..


// 1. 회사에서는 크게 2개의 상품을 준비합니다.
struct IPad { }
struct Pensil { }


// 2. 선물박스를 제작하기 위해, GiftBox란 프로토콜을 만들고, 내부에 giftType란 제네릭 타입을 선언합니다.
protocol GiftBox {
    associatedtype giftType // assoaciatedtype이란, 프로토콜 내부의 제네릭 타입
    
    // 연산 프로퍼티 gift는 내부 giftType 제네릭 타입이며, getter 속성만 가지고 있음
    var gift: giftType { get } // 연산 프로퍼티
}

// 3. 생산파트에서는 선물박스에 2개 상품을 GiftBox 프로토콜 규칙에 의해 생성합니다.

struct IPadBox: GiftBox {
    var gift: IPad
}

struct PensilBox: GiftBox {
    var gift: Pensil
}

// 4. 이후, 해당 선물박스의 내용물이 보이지 않도록 잘 포장할 수 있는 함수를 만듭니다.
// 오늘은 IPad가 들어있는 박스만 포장할 예정입니다.
// 그런데.. 오류가 발생합니다?
//func makeBox() -> GiftBox {
//    // GiftBox에 선언된 제네릭 타입(giftType)과 반환타입이 일치하지 않는다는 내용
//    return IPadGift.init(gift: .init())
//}

// MARK: - some 키워드
// 위 예시에서 오류가 발생한 이유는, 쉽게 말해 함수 외부에서는 GiftType이란 프로토콜의 제네릭 타입만을 반환 받는데,
// 이때 어떤 타입의 gift가 포함되어 있는지는 알 수 없기 때문입니다.

// 정리하자면, 실제 타입을 외부에서 결정짓는 제네릭 타입과 달리
// 타입을 외부에서는 알 수 없고, 내부에서 결정짓는 것이 바로 '불투명 타입' 입니다.

// 만약, 오늘이 아니라 내일은 makeBox() 메서드의 반환값을 PensilGift로 변환한다면,
// 결국 받는 사람(외부)의 입장에서 GiftType의 값 또한 변경되기 때문입니다.

// 따라서, '프로토콜의 제네릭 타입인 GiftType을 반환하긴 하는데, 함수 내부에서 알아서 결정해서 내보낼거야'라고 알리는 것이
// 바로 'some'이란 키워드 입니다.

func makeBox() -> some GiftBox {
    // RandomBox에 선언된 제네릭 타입(giftType)과 반환타입이 일치하지 않는다는 내용
    return PensilBox.init(gift: .init())
}

// 이렇듯 앞에 some 키워드를 붙여주게 되면, RandomBox란 프로토콜은 불투명 타입이 되며,
// makeBox 함수 내부에 값을 바꾸는 대로 특정 RandomBox의 타입이 결정되게 됩니다.


// MARK: - 그렇다면, SwiftUI에서 some View는 무슨 의미?
// 아래 ContentView 코드를 살펴보면..

struct ContentView: View {
    var body: some View {
        Text("Hello, 불투명 반환타입")
    }
}

// body 연산 프로퍼티는 구조체 ContentView가 View라는 프로토콜을 채택함에 있어서 정의된 프로퍼티이며,
// 위 코드에서의 'Text'를 반환하고 있는 것으로 볼 수 있음!

// 즉, 'some'이란 키워드가 View 프로토콜 타입 앞에 붙은 이유는?
// 결론적으로 View라는 프로토콜의 속성 중, associatedtype(제네릭)으로 선언된 body 프로퍼티와 View 타입이 있을것이라는!

// MARK: - some의 역할
// 앞서 some을 통해 불투명 타입을 알려주었으며,
// body 연산 프로퍼티 '내부'에 작성하는 코드에 따라 반환되는 리턴타입이 변화되는 동시에, View 프로토콜을 준수해야 함
// 아래와 같은 코드는 모두 반환되는 리턴값에 따라서

struct ButtonView : View {
    var body: some View {
        Button {
            // some Action
        } label: {
            Text("Hello, 불투명 반환타입")
        }

    }
}
