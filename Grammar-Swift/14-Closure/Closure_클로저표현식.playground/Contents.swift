import UIKit
import Foundation

// MARK: - Closure의 표현식

// 기존 함수(전역함수 및 중첩함수)의 표현식은?
/*
 
 func + name + ((argument Label) Parameters name) -> Return Type {
    // statement
 }
 
 */

// 클로저 표현식은?
/*
 
 {(parameters name) -> Return Type in
   // statements
 }
 
 */


// MARK: - 기존 함수와 클로저 표현식 비교
// 예제 1. sorted(by:) 메서드를 활용한 예제

// MARK: - 전역함수를 활용한 알파벳 순 이름정렬
//let name = ["Lime", "Alex", "Kim", "Bucky", "Chris"]

// backward란 함수는, 배열 순서에 따라 인자 2개를 비교함
// 첫번째 배열값이 두번째 배열값보다 크다면 true, 작다면 false를 반환함
// 문자열의 문자가 '더 크다'는 '알파벳 순으로 더 뒤에 위치한다' 란 의미와 같음
//func backward(_ name1: String, _ name2: String) -> Bool {
//    return name1 > name2
//}

// 따라서, sorted 메서드는 배열 자체에서
//var reversedName = name.sorted(by: backward)
//
//reversedName


// MARK: - 클로저 표현식을 활용한 알파벳 순 이름정렬

//let name = ["Lime", "Alex", "Kim", "Bucky", "Chris"]
//
//var reversedNameClosure = name.sorted(by: { name1, name2 in
//    return name1 > name2
//})
//
//reversedNameClosure // ["Lime", "Kim", "Chris", "Bucky", "Alex"]



// MARK: - 1급 객체로서의 클로저

// MARK: - 1. 변수와 상수에 대입할 수 있다.

// 특정 상수나 변수에 '클로저' 자체를 대입
//let helloName = { (name: String) -> String in
//    return "Hello, \(name)"
//}
//
//helloName("Lime") // "Hello, Lime"
//
//
//// 기존 (클로저를 대입한) 변수와 상수를 새로운 변수에 상수에 대입
//let callMyName = helloName
//callMyName("Lime")


// MARK: - 2. 함수의 반환값(return Value)로서 사용할 수 있다

//func helloName() -> () -> () {
//
//    return { () -> () in
//        print("Hello, Lime")
//    }
//}
//
//let callMyName = helloName()
//
//callMyName() // "Hello, Lime"


// MARK: - 2. 함수의 반환값(return Value)로서 사용할 수 있다


// 임의의 'name' 함수를 하나 선언합니다.
// 해당 함수의 타입은 ? ()->()
//func name() {
//    print("Hello, Lime")
//}

// 이후, '함수'를 매개변수 타입으로 받는 'helloName' 함수를 선언합니다.
//func helloName(callback: () -> ()) {
//    callback()
//}

// 1. 콜백(Callback)함수로서, 함수 자체를 전달인자 값으로 대입하는 경우
//helloName(callback: name) // "Hello, Lime"
//
//// 2. 호출할 시점에서, 전달인자 자체를 클로저로서 대입하는 경우
//helloName(callback: { () -> () in
//    print("Hello, Lime")
//}) // "Hello, Lime"




// MARK: - 클로저의 호출과 실행

// 1. 클로저가 대입된 변수/상수의 호출

// 'name'이란 상수에 클로저가 대입됨
let name = { () -> String in
    return "Hello, Lime"
}

// 대입된 'name' 상수 뒤에 괄호()를 붙여 호출
name() // "Hello, Lime"



// 2. 클로저 자체를 직접 실행

({() -> String in
    return "Hello, Lime"
})()
