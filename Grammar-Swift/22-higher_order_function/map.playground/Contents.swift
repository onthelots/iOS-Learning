import UIKit

// MARK: - Map(변형)
// 기존의 데이터를 변형하기 위해, 새로운 Container를 생성함
// for-in(반복문)과 기능적인 측면에서는 차이가 없으나, 코드가 간결해지며 컴파일러 최적화라는 이점이 존재함

// Map의 기본형태
// func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
// 매개변수 transform의 경우, 기존 컨테이너의 요소를 매개변수로 받으며, rethrows를 통해 정의한 클로저의 형태를 변환된 값이 담긴 새로운 컨테이너에 담아서 반환함.

// MARK: - 예시 : String 타입을 Int 타입으로 변환
// for-in 구문 활용
//let stringNumber: [String] = ["1","3","5","7"] // 문자열 타입의 배열
//var intNumber: [Int] = Array<Int>() // 정수타입의 새로운 빈 배열
//
//for number in stringNumber {
//    // 옵셔널 바인딩(if let)을 통해, 조건값을 정수로 변환
//    if let transformNumberToInt = Int(number) {
//        intNumber.append(transformNumberToInt) // 빈 배열에 조건값을 할당함
//    }
//}

//print(intNumber) // [1, 3, 5, 7]

//let stringNumber: [String] = ["1","3","5","7"]
//
//// 매개변수는 문자열(stringNumber)이며, 이를 정수(Int)형으로 변환합니다.
//var intNumber: [Int] = stringNumber.map { (number: String) -> Int in
//    return Int(number) ?? 0 // 반환하는 타입(intNumber 배열에 할당되는 값)은 Int로 타입변환된 값입니다.
//}
//
//print(intNumber) // [1, 3, 5, 7]


// 후행 클로저 활용

let stringNumber: [String] = ["1","3","5","7"]
var intNumber: [Int] = stringNumber.map { (Int($0)) ?? 0 }

print(intNumber) // [1, 3, 5, 7]
