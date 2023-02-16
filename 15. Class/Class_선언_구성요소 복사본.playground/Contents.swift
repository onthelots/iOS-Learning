import UIKit

// 서브클래싱과 상속

// MARK: - 기본 클래스
// 아무런 클래스도 상속받거나, 상속하지 않는 클래스
class Animals {
    var name: String?
    var age: Int?
    
    func sound() {
        print("캉캉캉")
    }
    
}


// MARK: - 서브 클래싱(SubClassing)
// 기본 클래스를 바탕으로, 새로운 클래스(하위 클래스)를 만드는 행위
// 계층구조에 따르면, 기본클래스는 상위클래스(SuperClass)가 되며, 상속을 받아오는 클래스는 하위 클래스(SubClass)가 됨


class Cat : Animals {
    var nickname: String?
}

// 초기화
let myCat: Cat = Cat()

// 상위 클래스(Animals)의 프로퍼티를 상속받아 값을 할당할 수 있음
myCat.name = "Miu"

// 물론, 본인 클래스(Cat) 내부에 있는 프로퍼티도 동일하게 값을 할당
myCat.nickname = "Pig"
myCat.nickname = "Pig"

myCat.name // Miu
myCat.nickname // Pig


// MARK: - 상위 클래스의 특징을 재 정의?
// 상위 클래스의 프로퍼티와 메서드를 하위클래스에서 다시 정의해서 사용할 수 없나?

// 1. 메서드 오버라이딩
class Dog: Animals {
    
    override func sound() {
         print("왈왈!")
    }
}
