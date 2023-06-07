# Types_of_Errors
`제약 조건을 설정하면서 발생하는 다양한 오류들`
> 디버깅을 통해, 왜? 어디서? 발생하는지 알아보고, 해결해보자

## 1️⃣ Unsatisfiable Layouts(충족되지 않은 레이아웃)

### 😡Identifying Unsatisfiable Constraints(충돌된 레이아웃)
- 말 그대로, 제약(Constraint)간의 충돌(2개 이상일 경우)로 인해 발생하는 오류
- 해당 오류가 발생할 시, 인터페이스 빌더는 아래와 같은 방식으로 오류를 표시하게 됨

![Frame 18](https://github.com/onthelots/iOS-Learning/assets/107039500/d8cbd04c-36cc-489e-858d-f5b1d70d778c)


```
1. Storyboard 내 Canvas에 빨간색으로 표시가 되거나, 
2. 충돌하는 제약조건에 대한 경고문고를 알려주고,
3. 빨간색 확장 화살표를 표시함
```

<br>

### 🖐🏻Preventing Unsatisfiable Constraints (방지하는 방법)
- View를 코드로 추가하는 경우에 상당히 많이 발생하게 됨
- 대표적으로 [translatesAutoresizingMaskIntoConstraints]
- 상위 뷰(SuperView)의 크기가 작아서, 화면에 다 표시하지 못하는 경우 높은 우선도를 설정하는 등의 방안을 마련해야 함

<br>
    
## 2️⃣ Ambiguous Layouts(애매모호한 레이아웃)

### 🔍Detecting Ambiguous Layouts (어떻게 발견하나?)
- 모호한 레이아웃을 식별하기 위한 [메서드]가 존재함!
- 해당 View가 생성되는 시점에 [breakpoint]를 생성한 후, debug 창에 아래 메서드를 작성함
- po self.(해당 View).메서드명

![Frame 19](https://github.com/onthelots/iOS-Learning/assets/107039500/cb7c5cd7-c879-48d1-a3b7-a7f890687f00)


<br> 

`hasAmbiguousLayout`
>hasAmbiguousLayout: 뷰의 프레임이 모호한 경우 YES(true)를 반환하고, 그렇지 않은 경우 NO(false)를 반환

<br> 

`exerciseAmbiguityInLayout`
> 가능한 유효한 솔루션 사이를 전환

<br>

`constraintsAffectingLayoutForAxis`
> 지정된 축을 따라 해당 뷰에 영향을 주는 모든 제약 조건의 배열을 반환합니다.

<br>

`constraintsAffectingLayoutForOrientation`
> 지정된 방향에 따라 해당 뷰에 영향을 주는 모든 제약 조건의 배열을 반환합니다.


<br>
    
## 3️⃣ Logical Errors(논리적 오류)

### 😭 Logical Errors = Bug
- 사람이 발생시키는 오류이므로, 다양한 이유가 존재함
- 가장 찾기 어렵고, 단계적 지침이 없으므로 실험과 반복적 테스트가 필요함
