import Foundation

// MARK: - 명령형, 선언형 프로그래밍
// 두 숫자를 곱한 결과를 나타내는 프로그래밍 코드


func multiply(number: [Int]) -> [Int] {
    
    var someNum: [Int] = [] // 1. someNum이란 빈 배열을 만들어 주고
    
    for i in 0..<number.count {
        someNum.append(number[i] * number[i])
    }
    // 2. for 조건문을 통해 각각의 배열의 요소가 해당 값의 제곱값으로 변환되어 포함될 수 있도록 하고
    
    return someNum // 3. 그 결과를 요소로 담아 새로운 배열을 반환한다.
}

multiply(number: [1,2,3]) // [1,4,9]


func multiply2(number: [Int]) -> [Int] {
    return number.map {$0 * $0 }
}

multiply2(number: [1,2,3])
