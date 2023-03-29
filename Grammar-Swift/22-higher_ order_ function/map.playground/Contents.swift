import UIKit

// MARK: - Map(변형)
// 기존의 데이터를 변형하기 위해, 새로운 Container를 생성함
// for-in(반복문)과 기능적인 측면에서는 차이가 없으나, 코드가 간결해지며 컴파일러 최적화라는 이점이 존재함

// Map의 기본형태
// array.map(transform: T throws -> T)
// T 타입의 transform을 받아, 새로운 T 타입의 컨테이너를 생성하는 것을 의미함


// MARK: - Map 활용예제 : [A배열] 내부에 있는 요소들을 '2배씩 곱해서' 새로운 [B배열]을 만드는 과정
// for-in 구문 활용

//let aArray = [1, 2, 3, 4]
//
//var bArray = Array<Int>()
//
//for num in aArray {
//    bArray.append(num * 2)
//}
//
//print(bArray) // [2, 4, 6, 8]


// map 활용
//let aArray = [1, 2, 3, 4]
//var bArray = aArray.map { (number: Int) -> Int in
//    return number * 2
//}
//
//print(bArray) // [2, 4, 6, 8]

// map 활용 (후행 클로저)
let aArray = [1, 2, 3, 4]
var bArray = aArray.map { (number: Int) -> Int in
    return number * 2
}

print(bArray) // [2, 4, 6, 8]

// map 활용 (후행 클로저)
//var bArray = aArray.map { $0 * 2 }
