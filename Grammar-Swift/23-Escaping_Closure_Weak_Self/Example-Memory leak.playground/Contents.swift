import UIKit

// MARK: - 일반적인 ARC 작동과정

//class Canis {
//
//    // ARC 할당&해제를 살펴보기 위한 임의 변수
//    static var countARC: Int = 0
//
//    init() {
//        Canis.countARC += 1 // ARC 증가
//        print("메모리에 할당되었습니다. 현재 RC는? : \(Canis.countARC)")
//    }
//
//    deinit {
//        Canis.countARC -= 1 // ARC 증가
//        print("메모리에서 해제되었습니다. 현재 RC는? :  \(Canis.countARC)")
//    }
//}
//
//var doggy: Canis? = Canis() // 메모리에 할당되었습니다. 현재 RC는? : 1
//var wolf: Canis? = Canis() // 메모리에 할당되었습니다. 현재 RC는? : 2
//
//doggy = nil // 메모리에서 해제되었습니다. 현재 RC는? :  1
//wolf = nil // 메모리에서 해제되었습니다. 현재 RC는? :  0


// MARK: - Retain Cycle
// 순환 참조, 즉 객체간의 강한 상호참조
// 이로 인해 객체의 값을 nil로 할당하여도 메모리 상에 해제(RC가 0이 되지 않는)이는 메모리 누수(Memory leak)가 발생하게 됨

//class Canis {
//
//    // ARC 할당&해제를 살펴보기 위한 임의 변수
//    static var countARC: Int = 0
//
//    var species: Canis?
//
//    init() {
//        Canis.countARC += 1 // ARC 증가
//        print("메모리에 할당되었습니다. \(Canis.countARC)")
//    }
//
//    deinit {
//        Canis.countARC -= 1 // ARC 증가
//        print("메모리에서 해제되었습니다. \(Canis.countARC)")
//    }
//}
//
//var doggy: Canis? = Canis() // Doggy 인스턴스가 메모리에 할당되었습니다. 1
//var wolf: Canis? = Canis() // Doggy 인스턴스가 메모리에 할당되었습니다. 2
//
//doggy?.species = wolf // 메모리에 할당되었습니다. 1
//wolf?.species = doggy // 메모리에 할당되었습니다. 2
//
//
//// 여기서, 각각의 인스턴스 객체에 nil을 할당하였지만, 해제 로그가 발생하지 않음
//doggy = nil // ?
//wolf = nil // ?

// 이는, doggy와 wolf의 프로퍼티 객체가 서로 강한 참조(strong reference)를 하고 있기 때문.
// 이와 같은 형태가 바로 '순환참조(Retain Cycle)'이며, 메모리가 지속적으로 Heap영역에 남아있기 때문에 메모리 누수가 발생함

// MARK: - 어떻게 해결할 것인가?
// 객체의 레퍼런스는 크게 3가지가 존재함
// 1. strong : 일반적인(default) 객체 레퍼런스. 위 예시에서의 객체는 모두 strong한 레퍼런스를 가지고 있음
// 2. weak : RC를 참조하지 않는 객체 레퍼런스. weak한 레퍼런스만 메모리에 남아있다면, 자동으로 해제됨 (따라서, 반드시 optional 타입)
// 3. unowned : weak과는 동일한 기능을 가지고 있으나, 항상 값이 있음을 가정함 (Optinal타입이 아니지만, 해제 이후에 접근하면 오류 발생)

// MARK: - weak 참조 레퍼런스 활용을 통한 메모리 누수 해결
class Canis {

    // ARC 할당&해제를 살펴보기 위한 임의 변수
    static var countARC: Int = 0

    weak var species: Canis?

    init() {
        Canis.countARC += 1 // ARC 증가
        print("메모리에 할당되었습니다. \(Canis.countARC)")
    }

    deinit {
        Canis.countARC -= 1 // ARC 증가
        print("메모리에서 해제되었습니다. \(Canis.countARC)")
    }
}

var doggy: Canis? = Canis() // Doggy 인스턴스가 메모리에 할당되었습니다. 1
var wolf: Canis? = Canis() // Doggy 인스턴스가 메모리에 할당되었습니다. 2

doggy?.species = wolf // 메모리에 할당되었습니다. 1
wolf?.species = doggy // 메모리에 할당되었습니다. 2


// 해제 로그 또한 정상적으로 작동한다.
doggy = nil // 메모리에서 해제되었습니다. 1
wolf = nil // 메모리에서 해제되었습니다. 0


