# MVVM 개념 이해하기
## MVC 패턴이란?
- Model, ViewController, View 형태의 개발 패턴을 의미함
- 애플에서 가이드하는 MVC 패턴은 아래와 같음
![MVC 패턴1](https://user-images.githubusercontent.com/107039500/229441160-dfe68635-0844-413e-9103-c823fb755417.png)
- 하지만, 실제 개발을 진행하는 과정에 있어서 View와 ViewController는 분리되지 않음
- UIKit에서 ViewController에서 특정 View의 UI를 결정하는 것 처럼 ViewController에 과도한 많은 업무가 과중됨
![MVC 패턴_실제](https://user-images.githubusercontent.com/107039500/229441960-8971f753-238c-4497-baff-fda733b9b885.png)


## MVC 패턴의 문제를 어떻게 해결해야 하나?
- ViewController를 View의 '하위 레이어'로 구상하되, 기존 Model의 데이터 가공역할을 제외시키자!
   - ViewController는 데이터를 View에 표시하는 역할이나, 사용자의 인터렉션만 받을 수 있도록 함 
- Model을 가공하는 역할은, [ViewModel] 객체가 담당할 수 있도록 하자!
   - 예를 들면, Model에 Date 타입이 있을 경우엔 String으로 변환하는 역할을 ViewModel에서 담당하고 ➟ ViewController에서는 활용만
- 결론적으로, MVVM (Model, View, ViewModel) 패턴을 활용하자

## MVVM이란?
- Model, View, ViewModel 형태의 개발패턴
- 각각의 객체는 직렬적인 관계를 가짐 (Model ➟ ViewModel  ➟ View(ViewController))
![MVVM_패턴](https://user-images.githubusercontent.com/107039500/229443320-43dc0e21-3ba8-4de5-a5a3-0defcc3dc8fd.png)

- View(ViewController)는 ViewModel을 들고 있음
- ViewModel은 Model(Data)의 데이터를 받아 가공함

### ViewModel의 주요 역할
- Data ➟ Output (Model의 데이터를 가지고 View에 적용될 수 있도록 가공할 수 있음)
- User Action ➟ Input (사용자의 인터렉션에 대한 처리를 담당하며, 액션 수행에 대한 로직을 처리함)
