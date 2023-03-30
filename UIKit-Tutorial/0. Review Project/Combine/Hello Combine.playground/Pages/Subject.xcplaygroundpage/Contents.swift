import Foundation
import Combine

// MARK: - Subject
// Subject란 퍼블리셔는 send(_:) 메서드를 활용하여 이벤트 값을 직접 주입시키는 퍼블리셔임 (즉, 미리 선언해두는 것이 아닌, 밖에서 값을 방출할 수 있음)
// protocol Subject : AnyObject, Publisher
// 근데, Combine에서는 미리 만들어진 subject가 2개나 존재함
// 바로, PassthroughSubject, CurrentValueSubject


// MARK: - 1. PassthroughSubject
// 구독자에게 바로 데이터를 전송하며, 본인은 남기지 않음
// Output 타입과 Error 타입을 결정해야 함 (초기값은 없어도 무방함)

// 퍼블리셔 relay 선언
let subject1 = PassthroughSubject<String, Never>() // 초기값이 없어도 되겠지?

// 구독자 선언 (sink)
let subscription1 = subject1
    .sink { completion in
        print("구독자1은 성공적으로 값을 제공받았습니다.", completion)
    } receiveValue: { value in
        print("구독자1가 제공받는 값은? : \(value)", value )
    }


// 이어서 새로운 구독자를 선언해보자면..
let subscription2 = subject1
    .sink { completion in
        print("구독자2는 성공적으로 값을 제공받았습니다.", completion)
    } receiveValue: { value in
        print("구독자2가 제공받는 값은? : \(value)", value)
    }
// 근데, 여기까지 하면 아무런 값을 던지지 않잖아 (퍼블리셔라는 subject relay가 가지고 있는 값이 없으니
// 그래서, send(_:) 메서드를 활용해 밖에서 값을 방출할 수 있음!

// 퍼블리셔 relayd에서 'send'를 통해 데이터를 전송
subject1.send("Hello")
subject1.send("World")

/*
 >> 아래와 같이 사이좋게 데이터를 제공받았음!
 구독자1가 제공받는 값은? : Hello Hello
 구독자2가 제공받는 값은? : Hello Hello
 구독자1가 제공받는 값은? : World World
 구독자2가 제공받는 값은? : World World
 */

// 만약, 구독자1이 더이상 데이터에 관심이 없어서 구독을 끊고자 한다면? -> 직접 cancel() 메서드를 활용할 수 있음

subscription1.cancel()
subject1.send("Still there?")

// 구독자2가 제공받는 값은? : Still there? Still there? -> 구독자 1은 더이상 데이터를 제공받지 않게 됨

// 더이상 Subject가 데이터를 보내지 않는다면?
subject1.send(completion: .finished)

// 그런데, 또 데이터를 보내고자 한다면..
subject1.send("Knock Knowck")

// 구독자2는 성공적으로 값을 제공받았습니다. finished -> 구독 이벤트가 끝나게 되었으므로, 더이상 다른 이벤트나 값을 받지 않게됨




// MARK: - 2. CurrentValueSubject
// PassthroughSubject와는 달리, 초기값과 최근 발행된 요소를 가지고 있음!
// 따라서, Output 타입에 대한 초기값이 반드시 필요함 (왜? 남겨야 한다는 속성이 존재하기 때문)


let subject2 = CurrentValueSubject<String, Never>("Good Morning")

//subject2.send("Initial Text") // 미리 데이터를 가지고 있을 수도 있음! (send 메서드)

// 해당 퍼블리셔에 .value 메서드를 활용해서 가지고 있는 데이터를 출력해보면?
print(subject2.value) // Initial Text!

// 이후 구독자를 생성해볼까요?
let subscription3 = subject2
    .sink { completion in
        print("구독자3은 성공적으로 값을 제공받았습니다.", completion)
    } receiveValue: { value in
        print("구독자3이 제공받는 값은? : \(value)")
    }

// 구독자3이 제공받는 값은? : Initial Text

// 이후, 새로운 데이터를 전송해봅시당
subject2.send("Good Night")

/*
 구독자3이 제공받는 값은? : Initial Text
 구독자3이 제공받는 값은? : Good Night
 */

print(subject2.value) // Good Night (최근 현재값이 출력이 됩니다)


// MARK: - 구독자(Subscription)를 미리 만들어준다면?
// 아래와 같이, 아무 데이터도 없는 비어있는 상태의 구독자를 만들어줄 수도 있음
var subscription4 = Set<AnyCancellable>()

let subject3 = CurrentValueSubject<String, Never>("I'm Publisher")

subject3
    .sink { print($0)} // 귀찮으니, 후행클로저로 만들어 버리고..
    .store(in: &subscription4) // store(in:_) 메서드를 활용하여 in-out 파라미터로서 비어있는 상태의 구독자(subscripiton4)를 할당할 수도 있음!

// 이후, 퍼블리셔가 새로운 값을 방출해보자면..
subject3.send("New Value")

/*
 I'm Publisher
 New Value
 */



// MARK: - 퍼블리셔가 미리 데이터를 가지고 있으며, 다른 퍼블리셔에게 데이터를 전달한다면?
let publisher = ["Here", "we", "go"].publisher

publisher.subscribe(subject3)
// subject3에게 전달된 데이터

/*
 I'm Publisher
 New Value
 Here
 we
 go
 */
