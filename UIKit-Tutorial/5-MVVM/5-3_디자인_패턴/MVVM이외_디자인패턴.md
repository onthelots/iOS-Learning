# MVVM 이외의 패턴
## 다양한 디자인 패턴들
- MVP, VIPER, Ribs, Elm 등 다양한 디자인 패턴이 존재함
- MVVM 또한, MVVM-Coordinator, MVVM-ViewState 등으로 분류됨

## 다양한 기술들과 디자인패턴에 대한 고찰
- 디자인 패턴은, 일종의 '도구'이지 궁극적인 목표가 아닐 수 있음
- 본질적인 목표이자 문제는 '고객을 만족시키는 서비스를 전달하기 위해 소프트웨어(도구)를 활용하는 것이 중요'하다는 것을 인지해야 함
- 이는 '애자일 4대 가치'에 잘 드러나 있음 (http://agilemanifesto.org/iso/ko/manifesto.html)


## 클린 아키텍쳐(Clean Architecture)
- 고객만족 = 잘 만든 소프트웨어
- 이러한 과정을 잘 나타낸 디자인 패턴이 바로 '클린 아키텍쳐'

### 🔍 클린 아키텍쳐란?
- ① 레이어(Layer) 나누기(Entities, Use Cases, Presenters, DB 및 UI)
- ② 의존성 관리(내부 레이어는, 바깥쪽 레이어에 대해 전혀 알지 못함)
![클린 아키텍쳐](https://user-images.githubusercontent.com/107039500/229504507-2f6240f8-138d-40ca-bd47-4594f67c5fa0.png)


- 요약(https://blog.coderifleman.com/2017/12/18/the-clean-architecture/)

###  📲 iOS에서 클린 아키텍쳐를 구현한다면?
- 클린 아키텍쳐를 활용하여 앱을 구현해 본다면.. 다음과 같은 '레이어'로서 구분됨
- Layer1 : Domain
- Layer2 : Presentation
- Layer3 : Data 
![ios with Clean architecture](https://user-images.githubusercontent.com/107039500/229504814-737a2e3b-ddaa-4fd5-a308-69a88b2875d0.png)

###  Layer의 역할과 기능
- Domain : Use Case와 Model 
- Presentation : View 혹은 ViewModel
- Data : Repository, DataStore, Entity
- Dependency(의존성)의 경우, Presentation과 Data layer가 ➟ Domain Layer로 흘러가는 구조
![layer](https://user-images.githubusercontent.com/107039500/229506101-acf8fde0-285e-4708-835a-9b554632eddb.png)
![layer detail](https://user-images.githubusercontent.com/107039500/229506110-6f3ff0b8-96e8-4ce8-a253-5171f97753fa.jpeg)

###  iOS with Clean Architecture
- 클린 아키텍처를 iOS에서 구현하는 구체적인 흐름은 아래와 같음
![Ios](https://user-images.githubusercontent.com/107039500/229507081-20e5f50c-db50-4f88-ac8f-144dc62872d1.png)
