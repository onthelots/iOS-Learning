//: [Previous](@previous)

import Foundation
import Combine

// MARK: - Map(변환, Transform)
let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
    .map { $0 * 2 } // Operator -> 배열의 요소들에 x2를 해서, 출력할 수 있도록 (변환)
    .sink { value in
        print("Transformed Value : \(value)")
    }

// Publisher에 값을 할당
numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)

/*
 Transformed Value : 20
 Transformed Value : 40
 Transformed Value : 60
 */
subscription1.cancel()


// MARK: - Filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a")}
    .sink { value in
        print("Filter Value : \(value)")
    }

stringPublisher.send("Lime")
stringPublisher.send("Kate")
stringPublisher.send("Jim")
// 결과는? Filter Value : Kate ("a"가 포함된 데이터만 보냄)

subscription2.cancel()



//: [Next](@next)
