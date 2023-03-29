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
        print("Receive : \(string), \(num)")
    }

//stringPublisher.send("a")
//stringPublisher.send("b")
//stringPublisher.send("c")

// 하나의 publisher만 보냈을 땐, 아무런 반응이 없음! (다시 말해, 2개 모두 데이터가 포하되어야 함)

//numPublisher.send(1)
//numPublisher.send(2)
//numPublisher.send(3)


// 순서를 조금 섞어보자면..

stringPublisher.send("a")
numPublisher.send(1)
stringPublisher.send("b")
stringPublisher.send("c")
numPublisher.send(3)

/*
 // 순서대로 a가 먼저 오고, 그 다음에 1이 오니까, 첫 번째 보내는 데이터는 a, 1
 // 이후 b가 오고, 1은 그대로 유지되니까 b, 1이 보내지고..
 // c가 오고 1은 유지되니까 c, 1
 // 마지막으로 3이 추가될 때? -> c, 3
 Receive : a, 1
 Receive : b, 1
 Receive : c, 1
 Receive : c, 3
 */



// MARK: - Advanced CombineLatest
// 아이디와 패스워드의 퍼블리셔를 사용, 유효한지 여부를 Boolean 값으로 표현하고자 한다면?

let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

// 동일하게, validatedCreatialSubscription이란 구독티켓은 usernamePublisher + passwordPublisher를 결합한 combineLatest
// map(operator)기능을 통해 변환하는데.. -> 여기서 Transform 방식이 바로 Boolean 값을 리턴하는 것
let validatedCreatialSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("닉네임과 비밀번호가 유효하나요? : \(valid)")
    }

usernamePublisher.send("Lime")
passwordPublisher.send("1234")
// 결과는 >> 닉네임과 비밀번호가 유효하나요? : false (비밀번호가 12자 보다 적으니..)

passwordPublisher.send("123456789101123112")
/*
 닉네임과 비밀번호가 유효하나요? : false
 닉네임과 비밀번호가 유효하나요? : true !
 */



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
