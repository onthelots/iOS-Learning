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
    
    init(name: String) {
        self.name = name
    }
    
    func wakeUp() {
        print("침대에서 몸을 일으키다")
    }
}

var jason: Human2 = Human2(name: "Jason")

jason.name // Jason
jason.wakeUp() // 침대에서 몸을 일으키다

