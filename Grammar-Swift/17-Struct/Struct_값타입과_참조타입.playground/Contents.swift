import UIKit

// MARK: - Swift의 구조체
// 구조체, 클래스는 구조가 비슷해 보이지만, 상황에 따라 어떤것을 사용해야 할지 결정해야 할때 가장 큰 차이점이 존재함
// 예를 들어, 아래와 같은 형태의 클래스와 구조체를 선언한다고 가정하자.

// MARK: - 동일한 구조의 클래스와 구조체
// name이란 이름의 프로퍼티와 인스턴스 메서드(wakeUp)가 존재합니다.


class Human1 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func wakeUp() {
        print("침대에서 몸을 일으키다")
    }
}

var lime: Human1 = Human1(name: "Lime")

lime.name // Lime
lime.wakeUp() // 침대에서 몸을 일으키다

// 구조체에서는 어떻게 선언할까요?
// class 키워드 대신, 'struct'란 키워드를 사용합니다.

struct Human2 {
    var name: String
    
//    init(name: String) {
//        self.name = name
//    }
    
    func wakeUp() {
        print("침대에서 몸을 일으키다")
    }
}

var jason: Human2 = Human2(name: "Jason")

jason.name // Jason
jason.wakeUp() // 침대에서 몸을 일으키다



// 그렇다면, 구조체와 클래스의 차이점은 무엇일까?
// 바로, 1. 인스턴스가 복사되거나, 2. 메서드/함수에 인자가 전달될 시 발생하는 동작에 큰 차이가 있다.

// MARK: - 값 타입 vs 참조 타입
// MARK: - 구조체는? 값(Value)타입!
// 구조체의 경우, 인스턴스가 복사되거나 메서드에 전달될 때,
// 해당 인스턴스의 '복사본'이 생성되면서 원본 객체가 가진 모든 데이터를 그대로 복사해서 갖는다.
// 다시 말해, 복사본은 원본에서 파생된 첫 번째 인스턴스와는 별개로, 자신만의 '값'을 가지게 되는 것

// 이는, 특정 A란 인스턴스에 대한 B, C, D와 같은 복사본이 여러개 존재할 수 있으며,
// A 인스턴스의 값을 변경한다고 해도, 다른 복사본에게는 영향을 미치지 않는다! (마치, 특정 Folder를 복사한 후, 복사한 폴더의 데이터를 임의로 바꾼다고 해도 기존에 복사했던 원본의 데이터가 바뀌지 않는 것 처럼)

// MARK: - 클래스는? 참조(Reference) 타입!
// 그렇다면 클래스는? 구조체와 반대겠지
// A란 인스턴스가 복사되거나, 매개변수로 전달되면 ->
// 해당 클래스 인스턴스가 있는 메모리(저장장소)의 '위치'에 대한 일종의 '참조체'가 만들어 지게 됨

// 따라서, 참조체를 변경하게 되면 A 원본 인스턴스에도 동일하게 영향을 미치게 됨
// 즉, A 원본 인스턴스를 참조하고 있는 A1, A2, A3 인스턴스가 있으며, 이는 A 원본만을 바라보게 됨


// MARK: - 실제 코드를 통해 살펴보자면?

// 1. 구조체 Animals를 생성한다
//struct Animals {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func sound() {
//        print("캉캉캉")
//    }
//}
//
//let myDog: Animals = Animals(name: "Van")
//print(myDog.name) // "Van"
//
//// dog 인스턴스의 복사본을 만들어 보자!
//
//var yourDog = myDog
//yourDog.name = "Coco"
//print(myDog.name) // "Van"
//print(yourDog.name) // "Coco"

// 위와 같이, yourDog는 myDog의 복사본이므로, 자신만의 데이터 값을 변경할 수 있음


// 2. 클래스 Animals를 생성해 비교해보자면..
//class Animals {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func sound() {
//        print("얌얌얌")
//    }
//}
//
//let myDog: Animals = Animals(name: "Van")
//print(myDog.name) // "Van"
//
//var yourDog = myDog
//yourDog.name = "Coco"
//
//print(myDog.name) // "Coco" -> name 프로퍼티의 값을 변경했더니, 원본 클래스 인스턴스의 프로퍼티 값도 변경!
//print(yourDog.name) // "Coco"


// MARK: - 구조체를 활용하는 이유는?

// 메모리 구조 4개 영역(Code, Data, Heap, Stack) 중
// 우선, 구조체는 Stack(스택) 영역에 저장됨
// 스택의 경우, 각각의 스레드를 독립적으로 사용하므로 'Thread-Safe'하다는 특징이 있음

// 반면에, Class와는 달리 상속(inheritance)은 불가능 하나,
// Swift에서는 Protocol을 활용한 상속을 권장하고 있음

// MARK: - 그렇다면, 클래스는 언제 사용해야 하는데?

// 클래스는 참조(Reference)타입이며, 기존 원본의 값을 -> 특정 참조체에서 변경 할 경우 그 변경값이 원본에도 적용이 됨
// 이는 즉, 한 영역에서 수정을 하면 다른 영역에도 적용이 된다는 특징이 있음
// 그래서, 고유한 값이나, 파일관리, 네트워크 등과 같은 부분에서 활용됨
