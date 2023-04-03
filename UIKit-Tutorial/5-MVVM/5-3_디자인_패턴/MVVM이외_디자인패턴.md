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
- 요약(https://blog.coderifleman.com/2017/12/18/the-clean-architecture/)

###
