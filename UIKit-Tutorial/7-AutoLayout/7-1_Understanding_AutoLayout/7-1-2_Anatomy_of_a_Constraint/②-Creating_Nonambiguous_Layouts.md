# Creating Nonambiguous Layouts (모호하지 않은 레이아웃 만들기)
`모호하지 않은 레이아웃이란..`
> 컴퓨터에게 '정확한' 명령, 즉 [Layout]을 제시하기 위해 명확한 지침이자 제약(Constraint)을 알려줘야 함.  

## Nonambiguous Layouts

### 🔍 모호하지 않은 레이아웃 (예시)
- 상위 뷰(SuperView) 내부에 하위 뷰(SubView)를 생성하고, 크기 및 위치를 설정하고자 함.
- 하위 뷰는 상위 뷰의 중앙(Center)에 위치하고 있음
- 이는 크게 [3가지] 방식으로 제약을 설정할 수 있으며, 모호하지 않은 레이아웃을 만들기 위해 다음과 같은 명령을 내릴 수 있음

<br>

![Frame 2](https://github.com/onthelots/iOS-Learning/assets/107039500/9a6c7915-20b6-4c1f-b7eb-b8b24777b8bd)

<br>

`Size & Location`
> 하위 뷰의 [너비(Width)]값과 상위 뷰의 Leading 위치로부터 일정 point만큼 떨어질 수 있도록 제약을 설정 

<br> 

`Location (1)`
> 하위 뷰의 너비값은 알 수 없으나, 상위 뷰의 Leading, Trailing으로 부터 동일한 point 만큼 떨어뜨리는 제약을 설정

<br>

`Location (2)`
> 하위 뷰를 상위 뷰의 X축 중앙(Horizontal Center)에 위치 시키고, 상위 뷰의 Leading으로부터 일정 point 만큼 떨어뜨리는 제약을 설정

<br>

### 👆🏻 모호하지 않은 레이아웃을 위하여
- 해당 class(혹은 Components)의 [위치]와 [크기]만 알 수 있다면, 명확한 레이아웃을 만들 수 있음
- 하지만, 위 예시와 같이 '어떻게 표현할 것인가'란 고민을 통해 레이아웃 방식을 선택해야 함

