import UIKit

// MARK: - reduce : 기존 컨테이너의 요소를 '결합'한 결과를 반환


// MARK: - reduce 기본형태
//func reduce<Result>(_ initialResult: Result,
//                    _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result

// initialResult -> 초기값으로 사용할 값을 할당하며, 클로저 실행 시 nextPartialResult에 전달 (결합을 위해)
// nextPartialResult -> initialResult와 요소의 값을 매개변수로 할당받아, 새로운 결과(누적값)로 전달함


// MARK: - 예시1 : Int배열의 각 요소의 합

// for-in 구문
//let numbers: [Int] = [1,3,5,7,9]
//var sum: Int = 0
//
//for number in numbers {
//    sum += number
//}
//
//print(sum) // 25 (1+3+5+7+9)


// reduce 활용
//let numbers: [Int] = [1,3,5,7,9]
//
//// reduce(괄호 -> initialResult) { (클로저 내부의 첫번째 매개변수는 initialResult, 두번째 매개변수는 요소값) -> 누적값을 반환 }
//var sum: Int = numbers.reduce(0) { (first: Int, second: Int) -> Int in
//    return first + second // first(initialResult) + second(요소의 누적(덧셈)값)
//}
//
//print(sum) // 25

// 표현식 1
let numbers: [Int] = [1,3,5,7,9]
var sum: Int = numbers.reduce(0, +)

print(sum) // 25


// 후행 클로저

//let numbers: [Int] = [1,3,5,7,9]
//var sum: Int = numbers.reduce(0){ $0 + $1 }
//
//print(sum) // 25
