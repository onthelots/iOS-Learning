//: [Previous](@previous)

import Foundation
import Combine

// 구독하는 subscription이 담긴 Box를 아래와 같이 생성할 수 있음
var subscriptions = Set<AnyCancellable>()

// MARK: - removeDuplicates : 중복 데이터를 제거
// 배열 내부의 중복된 데이터를 걸러서 새로운 컨테이너로 만들어 냄
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ") // ["hey", "hey", "there!", "Mr", "Mr", "?"]
    .publisher // Publisher로 만듬

words
    .removeDuplicates() // 오퍼레이터 선언
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions) // 위에서 선언한 구독Box에 담아냄

/*
 // 중복된 words는 삭제
 hey
 there!
 Mr
 ?
 */
    

// MARK: - compactMap : 값을 변경했을 때, nil일 경우엔 데이터를 제거
// 일종의 Nil값을 걸러내는 filter역할로 볼 수 있음 (filter의 경우, 특정 조건인 Boolean 타입에 의거하여 나타냄)

let strings = ["a", "1.24", "3", "def"].publisher // 1.24, 3은 Int로 바꿀 수 있지 않을까?

let CharacterToFloat = Float("a") // 이건 말이 안되니까, nil값을 가져오게 됨
//let IntToFloat = Float("1.24") // 1.24 -> 가능함

strings
    .compactMap { Float($0) } // -> 이렇게 compactMap으로 변환하게 된다면, nil값이 있을 수 있음
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

/*
 // Float으로 타입 캐스팅이 가능한 이들만 출력함
 1.24
 3.0
 */


// MARK: - ignoreOutput : 새로 발생되는 이벤트 혹은 데이터에 대해 더이상 신경쓰지 않을 수 있는 기능 (ignore)

let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)")},
          receiveValue: { print($0)})
    .store(in: &subscriptions)

/*
 Completed with: finished
 */



// MARK: - prefix : 일종의 Filter, 데이터를 필터해서 받도록 함

let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: { print("Completed with: \($0)")},
          receiveValue: { print($0)})
    .store(in: &subscriptions)

/*
 // 앞에서 2자리 데이터만 가져올 수 있도록 함
 1
 2
 Completed with: finished
 */

//: [Next](@next)
