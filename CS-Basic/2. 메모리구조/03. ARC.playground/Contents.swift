import UIKit

// MARK: - ARC란?
// 메모리 영역 중, Heap 영역에 대해 알고 있다면?
// RC(Refefence Counting)란 개념에 대해 이해하고 있을 것임
// 여기서 RC는, Class의 인스턴스나 클로저 등 참조타입이 'Heap' 영역에 저장될 때 마다
// count가 하나씩(1개) 증가하는 Count를 의미함!

// MARK: - ARC의 이해를 위한 Heap 코드 예시

class Animals {
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
var myDog: Animals = Animals(name: "Coco") // 인스턴스의 값을 생성하고, 값을 init할 경우 Count가 한개씩 증가하게 됨! (+ RC 1)
// 그렇게 되면, Animals 클래스의의 주소값은 Stack에 저장이 되며, name: Coco는 Heap에 참조값이 할당이 됨!


// MARK: - 새로운 인스턴스의 생성과 Stack과 Heap의 할당과정
// 앞서 생성한 myDog를 할당받는 새로운 'yourDog' 인스턴스를 생성
// 참조타입이다 보니, 초기화 값이 없는 yourDog가 생성될 때 Heap에는 아무런 변화가 없으며,
// 대신 Stack에는 새로운 yourDog 주소값(Address)이 할당이 됨
var yourDog = myDog // (+ RC 1)


// 그런데, Heap 영역의 경우 release, free 등의 방법을 통해 원래 메모리를 해제해줘야 함!
// 하지만, 현재까지 인스턴스를 메모리에서 별도로 해제하지 않고 사용함
// 이는 사실, Swift의 ARC라는 기능이 자동적으로 Heap에 할당된 메모리를 해제하고 있던 중!
// 즉, 메모리 leak을 자동적으로 해소해주는 내장된 기능이 바로 'ARC'임


// MARK: - GC(Garbage Collection)과 RC(Reference Counting)의 비교
// Heap이란 메모리 영역은 언어를 초월한 개념임
// GC와 RC 모두 Heap 영역의 메모리를 해제하는 방식으로 볼 수 있음

// GC란?
// 예를 들면, JAVA는 GC(Garbage Collection)을 활용하여 Heap의 leak 메모리를 추적하여 인스턴스를 해제해 줌
// 하지만, 이는 Runtime(프로그램 실행) 단계에서 실행되므로, 계속적으로 추적하는 추가적인 리소스로 인한 성능저하가 발생한다는 단점이 존재함

// RC란?
// 반면에, 우리의 Swift에서 활용되는 RC는 Compile 단계에서 언제 참조되고 해제되는지 결정됨
// 따라서, 개발자가 참조 해제시점을 파악할 수 있으며 Runtime 시점까지 추적하지 않으므로 추가 리소스가 발생하지 않는다는 장점이 있음
// 다만! '순환 참조'가 발생할 경우, 앱을 삭제하기 전까지 메모리가 해제되지 않을 수 있음!


// MARK: - RC의 유형, MRC(MRR)와 ARC
// MRC와 ARC는 모두 RC(Reference Counting)의 역할을 담당하지만, 'Manual(직접해제)' 이나 'Automatic(자동해제)'이냐의 차이로 구별됨

// MRC의 경우, Objective-C에서 활용한 방식으로, retain, release와 같은 함수를 활용하여 heap의 메모리를 해제하였다면,
// ARC는 2011년 이후의 Objective-C와 Swift에서 활용되는 방식으로 자동으로 heap의 메모리를 관리, 해제함.


// MARK: - ARC의 세부기능(메모리 관리방식)
// 말 그대로, Reference count -> 참조의 횟수를 계산하는 방식을 통해 Heap의 할당된 메모리를 해제함.
// 다시 말해, 참조 횟수(RC)가 0이란 값을 가지게 된다면, '인스턴스'를 참조하고 있는 코드가 없으며 이후 메모리가 자동적으로 해제됨.

// MARK: - RC가 증가하는 경우
// RC는, 새로운 인스턴스를 생성하거나, 특정 인스턴스의 주소값(Address)가 변수에 할당될 시점에 증가된다.
// 위에서 활용한 예제를 그대로 가져와서 살펴보자면 다음과 같다.

// 1. 새로운 인스턴스를 생성
var cuteDoggy: Animals = Animals(name: "Van")
// 위와 같이 새로운 인스턴스를 생성하게 되면, cuteDoggy란 변수(주소값) -> Stack에 할당되며, cuteDoggy의 값 -> Heap 에 할당됨
// 이러한 경우, RC가 증가하게 됨! (RC +1)


// 2. 기존 인스턴스를 다른 변수에 대입
var wildDoggy = cuteDoggy // cuteDoggy인 'Van'이 사나운(wild) 강아지로 바뀜
// 이렇듯, 기존 인스턴스인 cuteDoggy를 새로운 변수인 wildDoggy에 대입하게 되면
// 2개의 변수(cuteDoggy, wildDoggy)가 Heap의 데이터 값을 '참조'하게 되므로 -> RC값이 증가됨! (RC +1)


// MARK: - RC가 감소(혹은 해제)하는 경우
// 새로운 인스턴스가 생성되어 참조값이 증가하거나, 기존 인스턴스를 새로운 변수에 대입하게 되면 RC가 증가하게 된다고 앞서 살펴봄
// 그렇다면, RC가 감소-혹은 해제-되기 위한 경우는 어떤 상황일까?

// 1. 특정 인스턴스를 가리키는 변수가 메모리에서 해제될 경우
// 새로운 Animals 인스턴스를 생성해보도록 함

func makePet(_ origin: Animals) {
    let cat = origin // cat이란 지역변수에 매개변수 값이 할당됨
}

var myCat:Animals = Animals(name: "Bebe") // myCat이란 새로운 인스턴스를 생성함 (RC + 1)

makePet(myCat) // makeCat 함수를 실행할 경우 -> makeCat 내부 cat 변수는 myCat을 참조하게 됨 (RC + 1)

// 그런데, 함수(메서드)가 종료되게 되면 Stack에 올라갔던 지역변수는 어떻게 된다? -> Stack에서 해제된다!
// 그렇게 되면, 참조하고 있었던 지역변수가 사라지므로, RC는 자동적으로 감소한다 (RC -1)


// 2. nil값이 할당된 경우
// nil, 즉 옵셔널 타입의 인스턴스가 생성된다고 가정할 때, 해당 인스턴스에 nil값을 할당하게 되면 RC는 감소하게 됨

var cow: Animals? = Animals(name: "Coby") // 옵셔널 타입의 cow를 생성하게 되면? (RC +1)
var neighborCow = cow // 기존 인스턴스를 할당받는 neighborCow란 새로운 변수가 생성된다면? (RC +1)

// 둘다 Optional 타입이므로, nil 값으로 초기값을 해제할 수 있음!
cow = nil // (RC -1)
neighborCow = nil // (RC -1) (Animals 클래스 내부에 선언해놓은 deinit 메서드에 따라 메세지가 함께 찍히게 됨)


// 3. 기존 인스턴스(변수)에 다른 변수의 값을 대입한 경우
// A란 인스턴스가 존재할 때, RC는 증가하지만
// B라는 인스턴스의 값을 A에 할당할 경우, A의 값이 '변경'되므로, 아무것도 참조하질 않아 RC는 감소, 해제됨

var doyoungChild: Animals? = Animals(name: "HaYesoul")
var jaejunChild: Animals? = Animals(name: "JeonYesoul")

doyoungChild = jaejunChild // HaYesoul이 deinit 되었습니다. (doyungChild의 RC는 0이므로, 자동으로 해제됨)


// 4. 참조로서 연결된 관계에서 Stack의 주소값이 사라질 경우
// 이해를 위해 아래 새로운 Human이란 클래스를 생성하고자 함

class Human {
    var age: Int
    var nickname: Animals = Animals(name: "Kate")
    
    init(age: Int) {
        self.age = age
    }
    
    deinit {
        print("Human이 Deinit 되었습니다.")
    }
}

var profile: Human? = Human(age: 25) // "kate가 init 되었습니다!"
// Human 인스턴스인 profile을 생성하게 될 경우 -> Heap 영역에 age와 nickname의 주소값이 포함되게 된다! (RC +1)
// 여기서 중요, Human 클래스 내부에 클래스 인스턴스가 일종의 '프로퍼티'로 존재하고 있음
// 따라서, profile 생성 시 Animals 인스턴스 또한 참조하게 됨 (RC +1)

// 만약, profile 인스턴스를 메모리에서 해제하기위해 nil 값을 할당하게 된다면
profile = nil

// 아래와 같이 순서대로 메모리가 해제됨 (동시에 해제되는 것이 아닌, 단계에 따라 RC가 감소하게 되면서 자연스럽게 해제됨)
// 첫 번째 -> Human이 Deinit 되었습니다. (RC -1)
// 두 번째 -> Kate이 deinit 되었습니다. (RC -1)



