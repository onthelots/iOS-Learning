import UIKit

// MARK: - ARC란?
// 메모리 영역 중, Heap 영역에 대해 알고 있다면?
// RC(Refefence Counting)란 개념에 대해 이해하고 있을 것임
// 여기서 RC는, Class의 인스턴스나 클로저 등 참조타입이 'Heap' 영역에 저장될 때 마다
// count가 하나씩(1개) 증가하는 Count를 의미함!

// MARK: - ARC의 이해를 위한 Heap 코드 예시

class Aniamls {
    var name: String
    
    init(name: String) {
        self.name = name
        print("\(name)이 init 되었습니다.")
    }
    
    // 인스턴스가 메모리 상에서 제거(de-allocation)되었는지 확인하기 위해 deinit 메서드 활용
    
    deinit {
        print("\(name)이 deinit 되었습니다.")
    }
}

// 아래와 같이 인스턴스 생성함
// MARK: - Reference Count의 증가
var myDog: Aniamls = Aniamls(name: "Coco") // 인스턴스의 값을 생성하고, 값을 init할 경우 Count가 한개씩 증가하게 됨!
// 그렇게 되면, Animals 클래스의의 주소값은 Stack에 저장이 되며, name: Coco는 Heap에 참조값이 할당이 됨!


// MARK: - Heap에 저장되는 주소값을 알아보기 위한 함수 만들기

func address(of object: UnsafeRawPointer) -> String {
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}

address(of: &myDog) // 0x1009bc890


// MARK: - 새로운 인스턴스의 생성과 Stack과 Heap의 할당과정
// 앞서 생성한 myDog를 할당받는 새로운 'yourDog' 인스턴스를 생성
// 참조타입이다 보니, 초기화 값이 없는 yourDog가 생성될 때 Heap에는 아무런 변화가 없으며,
// 대신 Stack에는 새로운 yourDog 주소값(Address)이 할당이 됨
var yourDog = myDog
address(of: &yourDog) // 0x100a0c8a8

