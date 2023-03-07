import UIKit

// MARK: - 클로저(Closure)란?
// 익명함수, 혹은 람다함수로 통용되지만, 사실 해당 개념은 클로저의 종류 중 하나인 '클로저 표현식'에 의한 것
// 람다, 그리고 캡처에 대한 개념을 중심으로 아래와 같은 예시를 살펴봄

// MARK: - 전역함수를 클로저 표현식으로 변경한다면?

// 1. 전역함수
//func sayHello () {
//    print("Hello")
//}
//
//sayHello() // Hello


// 2. 클로저 표현식

//let sayHello2 = { print("Hello")}
//sayHello2()


// MARK: - Swift에서의 클로저란?


func functionA() -> () -> Int {
    
    // count란 변수가 선언되어 있으며,
    var count: Int = 0
    
    func functionB() -> Int {
        return count + 1
    }
    
    return functionB
}

// closureExample에 functionA를 할당하게 되고,
let closureExample = functionA()

print("결과는?: \(closureExample())") // "결과는: 1"

//let result = closureExample()
//
//result
