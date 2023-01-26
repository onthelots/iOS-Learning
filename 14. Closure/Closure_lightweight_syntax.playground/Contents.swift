import UIKit


// MARK: - 클로저 경량문법

// 공통 코드
func name(closure: (String, String, String) -> String) {
    closure("Ap", "p", "le") // 콜백함수
}

// 일반적인 클로저 호출
name(closure: { (a: String, b: String, c: String) -> String in
    return a + b + c
}) // "Apple"


// MARK: - 1. 매개변수 및 리턴타입 생략(타입 유추)

name(closure: { (a, b, c) in
    return a + b + c
}) // "Apple"



// MARK: - 2. 짧은 인자이름 - 매개변수의 이름을 Shortand Argument Names로 대체한다.

name(closure: {
    return $0 + $1 + $2
}) // "Apple"

// 함수와 동일하게, 단일한 return값만 보낼 경우엔 'return'키워드도 생략이 가능함
name(closure: {
    $0 + $1 + $2
}) // "Apple"


// MARK: - 3. 후행 클로저
// 함수의 매개변수 중, 클로저가 마지막 매개변수다? -> 후행 클로저(Trailing Closure)로 작성 가능

name {
    $0 + $1 + $2
} // "Apple"






// MARK: - 후행 클로저(Trailing Closure)
// 마지막 매개변수가 클로저라면, Argument Label은 생략된다!

// 하나의 클로저만 파라미터로 받는 'work' 함수
func work(closure: () -> ()) {
    closure()
}

// 만약에, 이를 호출하고자 한다면?

work(closure: { () -> () in
    print("Work Hard")
}) // Work Hard


/*
 그런데, 너무 복잡시럽잖아..
 그래서 클로저 자체를 매개변수로 불러 호출하지 않고 다음과 같이
 꼬리처럼 붙여서 사용할 수 있음!
 */

work { () -> () in
    print("Work Hard")
} // Work Hard


// 그런데, 함수의 매개변수가 여러개면 어쩌지..?

func works(start: () -> (), end: () -> ()) {
    start()
    end()
}

//
works(start: { () -> () in
    print("Work Start")
}, end: { () -> () in
    print("Work End")
})
// Work Start
// Work End

// 후행 클로저를 사용한다면? end: 매개변수를 생략할 수 있겠지?
// 함수가 여러개의 클로저를 가지고 있다면 첫번재 후행 클로저의 인자 라벨을 생략하고 남은 후행 클로저의 라벨은 표기!
works(start: {() -> () in
    print("Work Start")
}) {
    () -> () in
    print("Work End")
}



// 여기서 경량문법을 활용한다면, 어떤걸 생략할 수 있을까?

// 1. 타입유추 -> () -> ()와 in 키워드 삭제 가능
// 2. 매개변수와 리턴타입이 없다면 () 생략 가능
// 3. 하지만, 남은 후행클로저 라벨은 표시를 해야 함!

//works {
//    print("Work Start")
//} {
//    print("Work End")
//}


works {
    print("Work Start")
} end: {
    print("Work End")
}



