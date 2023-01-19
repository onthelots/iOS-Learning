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
//func myNickName(name: String) { } // myNickName(name:)


// 1-2. 인자(생략)가 있는 매개변수
//func myNickName(_ name: String) { } // myNickName(_:)


// 1-3. 인자(표기)가 있는 매개변수
//func myNickName(to name: String) { } // myNickName(to:)


// 1-4. 다중 매개변수
//func myNickName(name: String, age: Int) { } // myNickName(name: age:)


// MARK: - 2. 매개변수가 없을 경우

// 2-1. 하나의 매개변수
//func myCard() { } // myCard


// 2-2. 인자(생략)가 있는 매개변수
//func myHome() { }





// MARK: - 함수의 타입
// 함수의 타입은 개발자가 명명하는 '복합타입'이다.
// 함수 또한 '객체'이자 '1급객체' 성격을 가지고 있으므로 타입을 가질 수 있다.
// 다시말해, 함수의 타입을 통해 특정 변수/상수에 값을 대입할 수 있다.


// MARK: - 1. 매개변수가 1개 이상 존재할 경우

//func myNickname(_ name: String) { }
//
//// 함수 표기법을 사용해서 타입을 확인해보면..
//myNickname(_:)   // (String) -> ()
//
//
//func myTeamMate(_ name: String, _ age: Int, class: Character) {}
//myTeamMate(_: _: class:)  // (String, Int, Character) -> ()



// MARK: - 2. 매개변수와 리턴타입이 모두 존재할 경우
//func calculator(number: Int, _ count: Int) -> Int {
//    return number * count
//}
//
//calculator(number: _:)  // (Int, Int) -> Int


// MARK: - 3. 매개변수가 없을 경우

//func helloWorld () {} // helloWorld



// MARK: - 1급 객체함수

// MARK: - 조건1. 변수 또는 상수에 할당할 수 있다.

// 1. 변수와 상수에 할당하기

// 파라미터로 추가되는 값에서 1씩 빼는 함수를 만들고,
func countDidMinus(count: Int) -> Int {
    return count - 1
}

// minus란 상수에 함수 countDidMinus를 할당함!
let minus = countDidMinus

// 해당 상수를 호출하고, 처리값으로 4을 대입하면?
// 정상적으로 함수의 기능이 작동한다!
minus(4) // 3


// 2. 함수타입 명시하기

// 아래와 같이 동일한 이름의 함수(오버로딩)가 있을 경우
func coundDidPlus(_ count: Int) { }
func coundDidPlus(_ count: Int, _ label: String) { }


//let plus = coundDidPlus // 에러가 반드시 발생한다!

// 따라서, 함수의 타입을 작성해줌으로서 구분해야 함
// 첫 번째 함수를 할당하고자 한다면?

let plus1: (Int)-> () = coundDidPlus
// 정상적으로 할당


// 3. 함수 표기법 활용하기

// 아래와 같이 동일한 이름의 함수(오버로딩)가 있고,
// 타입(파라미터 형태) 또한 동일하다면?
func countWillDivide(count: Int) { }
func countWillDivide(_ count: Int) { }

// 이와 같이, 함수의 표기법을 이용하여 대입(할당)한다.
// 첫 번째 함수를 할당하고자 한다면?

let divide1 = countWillDivide(count:)
// 정상적으로 할당


// MARK: - 조건2. 함수의 반환값으로 함수 자체를 활용할 수 있다.

// 1. outside 함수 내 inside 함수가 있다?

// 파라미터로 추가되는 값에서 1씩 빼는 함수를 만들고,
func outside() -> () -> () {
    func inside() {
        print("inside 함수가 반환되었습니다.")
    }
    
    return inside
}

let callInside = outside()

callInside() // inside 함수가 반환되었습니다.



// MARK: - 조건3. 함수의 반환값으로 함수 자체를 활용할 수 있다.

// 1. 함수의 매개변수로서 활용되는 함수

// 매개변수로 활용할 함수 messageA를 선언함
func messageA() {
    print("Hello, Lime")
}


// 콜백함수를 작성하고, 매개변수 타입을 함수타입으로 작성함
func messageB(_ callback: () -> ()) {
    callback() // 매개변수를 반환함!
    // ()을 붙여주는 이유는, 함수를 '실행'해야 하기 때문
}

messageB(messageA) // "Hello, Lime" 



