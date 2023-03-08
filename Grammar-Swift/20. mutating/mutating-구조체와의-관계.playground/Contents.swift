import UIKit

// MARK: - mutating이란?
// 사전적 의미로, '변화시키다' 혹은 '돌연변이'
// 이는 즉, '원래는 그렇지 않은데 -> 특정 조건에 따라 돌연변이로 만드는' 행위로 볼 수 있다.
// 그렇다면, 이 mutating이 대체 구조체와는 무슨 연관이 있을까?


// MARK: - mutable과 immutable
// 사실, Swift 문법을 학습할 때 이미 mutable과 Immutable의 의미를 학습한 바 있음.
// 바로 var와 let이 mutable 특징에 따라 구분될 수 있음 (var -> mutable! / let -> immutable)
// 그렇다면, 참조 타입인 클래스는? -> 기본적인 default가 바로 항상 mutable하다고 볼 수 있음

// 반면에, Struct은? immutable과 mutable 성질을 모두 가지고 있음!
// 일반적인 인스턴스 메서드는, 구조체의 성질에 따라 immutable한 규칙을 지키기 위해 어떠한 property 값을 변경하지 않음
// 다만, mutable한 메서드를 사용할 경우가 존재할 수 있음!


// MARK: - 구조체의 메서드가 프로퍼티를 '변화시키기' 위한 키워드
// 구조체는 앞서 배운바와 같이, 클래스와는 달리 '값 타입(Value Type)' 이다.
// 그렇기 때문에, 구조체 인스턴스 메서드(<->타입 메서드)에서는 특정 Property를 수정할 수 없음 (Class는 가능)
// 하지만, 예외는 있는법. 구조체의 인스턴스 메서드를 통해 특정 프로퍼티를 수정하고 싶다면, mutating 키워드를 사용하면 됨


// MARK: - 예제 코드 (구조체 Animals)
struct Animals {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    mutating func defaultAge() {
        age = 5
    }
}


// 인스턴스 생성
var myDog: Animals = Animals(name: "Coco", age: 10)
myDog.defaultAge()

print(myDog.age) // 5


var yourDog = myDog

yourDog.age = 10
yourDog.defaultAge()
print(yourDog.age) // 5
