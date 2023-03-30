//: [Previous](@previous)

import Foundation
import Combine

// MARK: - Map(변환, Transform)
// 고차함수 Map과 동일한 기능을 제공하는 Operator
// 배열값을 Custom하여 새로운 컨테이너에 담아서 배출함

var subscription1 = Set<AnyCancellable>()
let numPublisher = CurrentValueSubject<Int, Never>(3)
    .map { value in
        value * 2
    }
    .sink { value in
        print("변환된 제공값은 : \(value)")
    }.store(in: &subscription1)

// 변환된 제공값은 : 6

// MARK: - Filter
// 고차함수 filter와 동일한 기능을 제공하는 Operator
// 해당 배열이 어떤 속성을 가지고 있는지 정의하며, 이를 새로운 컨테이너에 담아서 배출함

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
