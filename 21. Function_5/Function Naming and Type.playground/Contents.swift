import UIKit

// MARK: - Camel Case

// MARK: - Low Camel Case
// Function(함수), method(메서드), 인스턴스(변수 혹은 상수)


//func multiple (a: Int, b:Int) -> Int {
//    // some code...
//    return a + b
//}
//
//var myName: String = "Lime"


// MARK: - Upper Camel Case
// 타입s (클래스, 구조체, 열거형, 익스텐션, 프로토콜)

// 클래스
//class MyCar {...}

// 구조체
//struct MyPerson {...}

// 열거형
//enum MyFavoriteColor {...}





// MARK: - 함수 표기법
// 함수 표기법을 어디서 살펴볼 수 있나요?

//print("Hello")


// MARK: - 1. 매개변수가 있을 경우

// 1-1. 하나의 매개변수
//func myNickName(name: String) { }


// 1-2. 인자(생략)가 있는 매개변수
//func myNickName(_ name: String) { }


// 1-3. 인자(표기)가 있는 매개변수
//func myNickName(to name: String) { }


// 1-4. 다중 매개변수
//func myNickName(name: String, age: Int) { }


// MARK: - 2. 매개변수가 없을 경우

// 2-1. 하나의 매개변수
//func myCard() { }


// 2-2. 인자(생략)가 있는 매개변수
//func myHome() { }





// MARK: - 함수의 타입
// 함수의 타입은 개발자가 명명하는 '복합타입'이다.
// 함수 또한 '객체'이자 '1급객체' 성격을 가지고 있으므로 타입을 가질 수 있다.
// 다시말해, 함수의 타입을 통해 특정 변수/상수에 값을 대입할 수 있다.


// MARK: - 1. 매개변수가 1개 이상 존재할 경우

func myNickname(_ name: String) { }

// 함수 표기법을 사용해서 타입을 확인해보면..
myNickname(_:)   // (String) -> ()


func myTeamMate(_ name: String, _ age: Int, class: Character) {}
myTeamMate(_: _: class:)  // (String, Int, Character) -> ()



// MARK: - 2. 매개변수와 리턴타입이 모두 존재할 경우
func calculator(number: Int, _ count: Int) -> Int {
    return number * count
}

calculator(number: _:)  // (Int, Int) -> Int


// MARK: - 3. 매개변수가 없을 경우

func helloWorld () {}

helloWorld  // () -> ()
// Swift에서는 Void 대신 빈 괄호()로 나타냄
