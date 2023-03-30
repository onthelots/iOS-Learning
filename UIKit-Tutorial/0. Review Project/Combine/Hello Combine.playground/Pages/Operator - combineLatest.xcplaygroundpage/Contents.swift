//: [Previous](@previous)

import Foundation
import Combine


// MARK: - Basic CombineLatest
// 2개의 Publisher를 활용할 수 있다?! 빠슝

let stringPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

// 아래와 같이 시간축이 존재할 때..
// 만약, stirngPublisher가 ----  "a"    -----  "b"  --- "c" ---
// 그리고, numberPublisher가 --1-------2-----3------4--5-------
// 최신 데이터를 함께 합쳐서 받는 형식



// combineLatest 메서드를 통해 타 Publisher와 합체할 수 있음

stringPublisher.combineLatest(numPublisher)
    .sink { (string, num) in
        print("배출하는 값은 : \(string), \(num)")
    }

stringPublisher.send("a")
// 이미 결합이 되었으므로, 하나의 퍼블리셔만 데이터를 전송할 경우 아무런 반응이 없음

numPublisher.send(1)

// 배출하는 값은 : a, 1


// MARK: - CombineLastest의 순서는 어떻게 저장될까?
// 전송되는 데이터의 순서에 따라 순차적인 튜플 형태로 배출됨

stringPublisher.send("b")
stringPublisher.send("c")
numPublisher.send(2)
stringPublisher.send("d")
numPublisher.send(3)

// 위와 같이 전송을 하게 된다면..
// 배열의 최신값에 따라 배치되어 전송됨
/*
 배출하는 값은 : a, 1
 배출하는 값은 : b, 1
 배출하는 값은 : c, 1
 배출하는 값은 : c, 2
 배출하는 값은 : d, 2
 배출하는 값은 : d, 3
 */


// MARK: - Advanced CombineLatest
// 아이디와 패스워드의 퍼블리셔를 사용, 유효한지 여부를 Boolean 값으로 표현하고자 한다면?

let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

// 동일하게, validatedCreatialSubscription이란 구독티켓은 usernamePublisher + passwordPublisher를 결합한 combineLatest
// map(operator)기능을 통해 변환하는데.. -> 여기서 Transform 방식이 바로 Boolean 값을 리턴하는 것

let validation = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        // username이 비어있지 않고, password가 비어있지 않으며, password가 12자 이상일 경우만 리턴(Boolean)할 수 있도록(새로운 컨테이너로) 함
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("닉네임과 비밀번호가 유효하나요? : \(valid)")
    }

usernamePublisher.send("Lime")
passwordPublisher.send("10")

// 닉네임과 비밀번호가 유효하나요? : false (비밀번호가 12자리 이상이 아닐경우)

passwordPublisher.send("123456789101112")

// 닉네임과 비밀번호가 유효하나요? : true (return 조건에 도달)



// MARK: - Merge
// 기존까지는, CombineLastest를 통해 튜플(Tuple)형태로 넘어오는데,
// 타입이 같은 Publisher 또한 튜플로 넘겨야 할까?
// No! Merge를 활용하면 됨 (동일한 타입만 가능)

let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher


let mergePublisherSubscription = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge: subscription received value : \(value)")
    }

/*
 Merge: subscription received value : 1
 Merge: subscription received value : 2
 Merge: subscription received value : 3
 Merge: subscription received value : 4
 Merge: subscription received value : 5
 Merge: subscription received value : 300
 Merge: subscription received value : 400
 Merge: subscription received value : 500
 */







//: [Next](@next)
