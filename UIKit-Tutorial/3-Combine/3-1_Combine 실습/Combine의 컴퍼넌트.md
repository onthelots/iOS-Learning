# Combine의 컴퍼넌트

## 🔍 Combine Overview
- 3가지 주요 컴퍼넌트 👋🏻
    - Publisher : 생산자, 배출자, 크리에이터
    - Operator : 편집자, 가공시키는 사람
    - Subscriber : 소비자, 구독자, 받는 사람

- 컴퍼넌트의 관계
    - Operator가 아무런 작업을 하지 않을때 : Publisher(⚽️) ➟ Operator(?) ➟ Subscriber(⚽️)
    - Operator가 작업을 실시할 때 : Publisher(⚽️) ➟ Operator(⚙️) ➟ Subscriber(🏀)


## ① Publisher
- Publisher는 2개의 타입을 정의해야 함 (배출할 경우-Ouput와 실패하는 경우-Failure)
- Subscriber가 요청할 시, 데이터를 제공
- iOS에서는 Publisher를 자동으로 제공하는 경우도 있음 (NotificationCenter, Timer, URLSession.dataTask 등)
- Built-In Subscriber 
    - Just : 값을 다루는 Publisher
    - Future : 메서드를 다루는 Publisher

```swift
protocol Publisher {
    associatedtype Output
    associatedtype Failure: Error
    
    func subscribe<S: Subscriber>(_ subscriber: S)
        where S.Input == Output, S.Failure == Failure
}
```


## ② Subscriber
- Publisher에게 데이터를 요청할 수 있음
- Input과 Failure, 두 타입을 정의해야 함
- Publisher에게 '구독'을 한 이후, 갯수를 요청할 수 있음
- Built-In Subscriber
   - assign : Publisher가 제공한 데이터를 -> 특정 객체의 키패스에 할당함
   - sink : Publisher가 제공한 데이터를 받을 수 있도록 클로저를 제공함


```swift
protocol Subscriber {
    associatedtype Input
    associatedtype Failure: Error
    
    func receive(subscription: Subscription)
    func receive(_ input: Input) -> Subscribers.Demand
    func receive(completion: Subscribers.Completion<Failure>)
}
```

## ③ Operator
- Publisher에게 전달받은 값을 가공 후 Subscriber에게 제공
- 다양한 Builtin Operator가 존재함
    - map, merge, flatMap, drop, reduce, collect, contains...



## 📲 Subscriber & Publisher Pattern
- Subscriber와 Publisher 간의 관계
    - 1. Subscriber가 Publisher에게 접근 ("똑똑, 구독하고 싶어요!" / subcribe)
    - 2. Publisher는 Subscriber에게 Subscription을 할당 ("구독 티켓을 드릴게요" / receive(subscription:)
    - 3. Subscriber는 정보를 요청 ("정보를 보여주세요!" / request(_: Demand))
    - 4. Publisher는 Subscriber에게 정보를 전달 ("요청하신 정보입니다" / receive(_: Input))
    - 5. Publisher는 정보전달을 마무리함 ("전달이 완료되었습니다" / receive(completion:))
    
- Subscription이란?
    - Subscriber와 Publisher가 연결되었다는 것을 나타냄
    - 일종의 '구독 티켓' (데이터를 받을 수 있으나, 사라지게 되면 구독 관계도 종료됨)
    - Cancellable protocol을 따르고 있음



# Combine 컴퍼넌트 (세부)

## Publisher

### 👉🏻 Subject (Publisher)
- send(_:) 메서드를 활용, 이벤트 값을 주입시키는 퍼블리셔(Publisher)
    - 이러한 Subject를 활용하게 되면, 비동기 처리방식이 좀 더 쉬워진다는 특징이 있음
- ❓ BuiltIn Subscriber
    - PassthroughSubject : Publisher는 Subscriber의 요청 시 데이터 만을 전달 할 뿐, 해당 데이터 값을 가지고 있지 않음
    - CurrentValueSubject : Publisher는 Subscriber의 요청 시, 데이터를 전달하는 동시에 해당 데이터를 저장하고 있음


### 👉🏻 @Published (Publisher)
- 해당 키워드(@골뱅이)로 선언된 프로퍼티를 '퍼블리셔'로 만들어 줌
- Class에서만 활용 가능하며, 해당 퍼블리셔는 '$'를 활용하여 접근할 수 있음

```swift
class Weather {
    @Published var temperature: Double
    init(temperature: Double) {
        self.temperature = temperature
    }
}

let weather = Weather(temperature: 20)
let subscription = weather.$temperature.sink {
    print ("Temperature now: \($0)")
}
weather.temperature = 25

// Temperature now: 20.0
// Temperature now: 25.0
```


## Operator 
### ⏱️ Scheduler 
- 언제, 어떻게 작업을 수행하는지 결정하는 역할을 담당함
- 따라서, 백그라운드 혹은 메인스레드에서 작업을 실행할 수 있게끔 도움
- 2가지 메서드를 가지고 있음
    - subscribe(on:) : publisher가 어느 스레드에서 수행할지 결정함(작업의 정도에 따라 스레드를 설정)
    - receive(on:) : operator, subscriber가 어디서 데이터를 받아올 수 있는지, 또한 작업을 수행할 수 있을지 결정함(UI업데이트르 해야 하는데, 어느 스레드에서 받아오나?)
