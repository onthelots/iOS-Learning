import UIKit

// MARK: Filter
// 특정 조건에 따라, 기존 컨테이너의 내부값의 '필터링'을 통해 새로운 컨테이너를 생성
// map과 동일한 형태지만, 전체 요소를 필터링 하여 반환한다는 점이 차이라면 차이일 수 있음


// 기본형태
//매개변수 islncluded는, 기존 컨테이너의 요소를 매개변수로 받습니다.
// 특정 조건에 따라 배열에 포함되어야 하는지 여부를 확인, Bool 타입으로 반환합니다.
// -> 즉, isIncluded에 따라, true값에 만족하는 요소만이 새로운 컨테이너에 포함됩니다
// func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element]

// MARK: - 예시(기존 배열에서 짝수 요소만을 반환하는 배열)

// For-in 구문
//let input: [Int] = [1,4,7,8,12,15]
//var output: [Int] = Array<Int>()
//
//
//for number in input {
//    // 배열의 요소를 2로 나누었을 경우, 나머지가 0일 경우에만 새로운 컨테이너 output에 담아냄
//    if number % 2 == 0 {
//        output.append(number)
//    }
//}
//
//print(output) // [4, 8, 12]


// filter 활용

//let input: [Int] = [1,4,7,8,12,15]
//var output: [Int] = input.filter { (number: Int) -> Bool in
//    return number % 2 == 0 // 조건문 작성 (Boolean)
//}
//
//print(output) // [4, 8, 12]


// 후행 클로저

//let input: [Int] = [1,4,7,8,12,15]
//var output: [Int] = input.filter { $0 % 2 == 0 }
//
//print(output) // [4, 8, 12]


