# Combine이란?

## ✅RxSwift vs Combine
- 둘다 '비동기 프로그래밍' 프레임워크
- RxSwift(Reactive+Extension+Swift)는 라이브러리
- Combine은 2019년 WWDC에서 발표한 Apple에서 만든 Framework
- 점차 'Combine'으로 대체되어 개발이 진행되는 추세임


## ❓비동기? 동기? 

### 동기 : 요청과 결과가 1:1 위계
    - 친구와 함께 카페에서 대화를 하고 있는 과정 (즉, 피드백이 바로 옴)
### 비동기 : 요청과 결과가 동시에 일어나지 않음
    - 이메일 혹은 카카오톡으로 대화하는 경우 (피드백이 언제올지 알 수 없음)
    - 즉, 모바일 환경에서는 비동기 작업이 매우 중요함
    - 왜? Server에서 데이터를 받아오는 과정에서의 기다림과 사용자가 버튼은 언제 누를지 모르는 경우 등 비동기 상황이 다양하게 존재하기 때문


## 🤩 Combine의 등장
- 효율적인 비동기 처리를 위한 방식을 제공하기 위해 등장
    - 일관된 방식으로 비동기를 처리할 수 있는 API를 Combine으로 제공 


## 🔍Combine Overview
- 3가지 주요 컴퍼넌트 👋🏻
    - Publisher : 생산자, 배출자, 크리에이터
    - Operator : 편집자, 가공시키는 사람
    - Subscriber : 소비자, 구독자, 받는 사람
- 컴퍼넌트의 관계
    - Operator가 아무런 작업을 하지 않을때 : Publisher(⚽️) ➟ Operator(?) ➟ Subscriber(⚽️)
    - Operator가 작업을 실시할 때 : Publisher(⚽️) ➟ Operator(⚙️) ➟ Subscriber(🏀)
