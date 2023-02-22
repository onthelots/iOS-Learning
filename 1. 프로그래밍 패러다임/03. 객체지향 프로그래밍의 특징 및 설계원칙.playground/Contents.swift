import UIKit

// MARK: - 객체지향 프로그래밍의 4가지 특징
// 크게 4가지는, 추상화 / 캡슐화(은닉화) / 상속 / 다형성으로 나뉨


// MARK: - 1. 추상화
// 생성할 객체의 공통된 특징(속성 및 행위)을 추출, Class를 생성하는 것을 의미함
// 불 필요한 부분은 무시하고, 복잡성을 줄여 단순화를 지향함


// MARK: - 2. 캡슐화 / 은닉화
// 속성 및 행위를 하나의 캡슐로 묶어냄으로서 추후 재 활용성을 증진함
// 또한, 외부로의 간섭을 줄이고, 사용자에게 필요한 정보만을 제공하기 위해 은닉(hiding)을 지향함


// MARK: - 3. 상속
// 기존 클래스(부모 클래스)의 특징(속성 및 행위)을 하위 클래스에서 상속받아 활용하거나 확장할 수 있음
// 이는, 재 사용성과 확장성에 의미가 있음
// 장점 : 불필요한 코드가 줄고, 확장성에 따라 새로운 개념의 하위클래스를 창조할 수 있음
// 단점 : 상속받은 하위클래스가 존재할 경우, 관계되어 있는 상위클래스의 특징을 쉽게 변경하기 어렵거나 상속 자체가 잘못될 경우 프로그램의 문제가 발생할 우려가 있음



// MARK: - 4. 다형성
// 오버로딩, 오버라이딩과 같이 상위 클래스의 특징(행위)을 하위 클래스에서 필요에 의해 새롭게 정의할 수 있음
// 오버라이딩 : 상위 클래스에서 상속받은 하위 클래스에서 행위(메서드)를 필요에 의해 정의내림

// 상위 클래스 Car가 있고, 배기음 소리(exhaustSound)라는 메서드가 있음
class Car {
    func exhaustSound () {
        print("부앙~")
    }
}

var car: Car = Car()
car.exhaustSound() // "부앙~"


// 하위 클래스에서 exhaustSound를 재 정의한다면?

class Audi: Car {
    override func exhaustSound() {
        print("위잉~")
    }
}

// 위에서 선언된 인스턴스 'car'에 상속받은 하위클래스 Audi를 대입하고
car = Audi()

// exhaustSound 메서드를 실행하면?
car.exhaustSound() // "위잉~"


// 오버로딩 : 동일한 이름의 메서드가 매개변수의 이름, 타입, 갯수에 따라 다르게 동작할 수 있음

func printsayHello() {
    print("Hello : 미국의 인사말")
}

func printSayHello(language: String) {
    print("안녕하세요 : \(language)")
}

func printSayHello(_ language: String) {
    print("aloha : \(language)")
}

// 위 3개의 메서드의 이름은 printsayHello로 동일하지만?

printsayHello() // Hello : 미국의 인사말
printSayHello(language: "한국의 인사말") // 안녕하세요 : 한국의 인사말
printSayHello("하와이의 인사말") // "aloha : 하와이의 인사말"


