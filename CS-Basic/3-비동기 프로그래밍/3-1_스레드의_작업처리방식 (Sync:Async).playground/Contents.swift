import UIKit

// MARK: - Heap과 Stack
// "메모리 내 저장(할당)되는 기준이 무엇인가?"에 따라 구분됨
// 이는 타입이 그 기준이 되며, 동시에 'semantics' 라고 함
// 크게 value semantics, reference semantics로 구분됨

// MARK: - Value Sementics 타입 - Stack
// 해당 타입의 자료(인스턴스)는 stack 영역에 할당됨
// struct가 그 대표적인 타입

// 예시코드
struct Human {
    var age: Int
    var number: Int

    init(age: Int, number: Int) {
        self.age = age
        self.number = number
        print("당첨된 사람은 \(age)세 \(number)번입니다.")
    }
}

var man: Human = Human(age: 23, number: 7848)
var woman = man
woman.age = 35

// 여기서, Stack에는 어떻게 저장이 될까?
// man의 변수(age, number) -> 2칸
// woman은 man을 그대로 복사하며, 기존 man인스턴스와는 완전히 구분되어 Stack에 저장됨 -> 2칸


// MARK: - Reference Sementics 타입 - Heap
// 해당 타입의 자료는 Stack에 참조체인 '주소값'을 할당하며, '실질적인 데이터'는 Heap 영역에 할당함
// class와 함수가 대표적인 reference sementics 타입임


//class Human {
//    var age: Int
//    var number: Int
//
//    init(age: Int, number: Int) {
//        self.age = age
//        self.number = number
//        print("당첨된 사람은 \(age)세 \(number)번입니다.")
//    }
//}
//
//var man: Human = Human(age: 23, number: 7848)
//var woman = man
//woman.age = 35

// 여기서, class는 어떻게 저장이 될까?
// man의 참조체는 Stack에 저장이 되며,
// man의 실질적인 데이터인 age, number는 Heap 2칸(word)을 할당받음
// 또한, RC(reference Count)와 Type을 저장하는 2칸(word)을 더 할당하여, 총 4칸(word)를 할당한다.

// 이후, man을 할당받는 woman은 man을 복사하지 않으므로, Stack 영역에서 또 하나의 'woman'참조체가 생성된다.
// 동일하게, Heap에 저장된 실질적인 데이터를 참조한다.

// 만약, 실질적인 데이터인 'age'를 35로 변경하게 되면
// man, woman 참조체의 age 값도 모두 35로 변경된다.
// 즉, 이러한 방식을 reference sementic이라고 한다.
