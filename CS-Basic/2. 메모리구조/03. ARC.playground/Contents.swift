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


// 그런데, Heap 영역의 경우 release, free 등의 방법을 통해 원래 메모리를 해제해줘야 함!
// 하지만, 현재까지 인스턴스를 메모리에서 별도로 해제하지 않고 사용함
// 이는 사실, Swift의 ARC라는 기능이 자동적으로 Heap에 할당된 메모리를 해제하고 있던 중!
// 즉, 메모리 leak을 자동적으로 해소해주는 내장된 기능이 바로 'ARC'임


// MARK: - GC(Garbage Collection)과 RC(Reference Counting)의 비교
// Heap이란 메모리 영역은 언어를 초월한 개념임
// MARK: - GC란?
// 예를 들면, JAVA는 GC(Garbage Collection)을 활용하여 Heap의 leak 메모리를 추적하여 인스턴스를 해제해 줌
// 하지만, 이는 Runtime(프로그램 실행) 단계에서 실행되므로, 계속적으로 추적하는 추가적인 리소스로 인한 성능저하가 발생한다는 단점이 존재함

// MARK: - RC란?
// 반면에, 우리의 Swift에서 활용되는 RC는 Compile 단계에서 언제 참조되고 해제되는지 결정됨
// 따라서, 개발자가 참조 해제시점을 파악할 수 있으며 Runtime 시점까지 추적하지 않으므로 추가 리소스가 발생하지 않는다는 장점이 있음
// 다만! '순환 참조'가 발생할 경우, 앱을 삭제하기 전까지 메모리가 해제되지 않을 수 있음!
