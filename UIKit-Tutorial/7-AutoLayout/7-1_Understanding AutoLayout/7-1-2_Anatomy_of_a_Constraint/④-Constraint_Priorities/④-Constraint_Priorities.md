# Constraint_Priorities
`우선도에 따른 제약 설정`
> 제약과의 경쟁 관계를 설정함으로서 유동적인 Layouts을 만들 수 있다?!

## Constraint Inequalities
`각각 Red, Blue 색상의 View가 위치하고 있는데..`
> 상위 뷰(SuperView), 그리고 View간의 간격은 모두 동일하게 20 points



## Constraint Priorities
`각각 Red, Blue 색상의 View가 위치하고 있는데..`
> 상위 뷰(SuperView), 그리고 View간의 간격은 모두 동일하게 20 points



### 1️⃣ 상위 뷰(SuperView)와의 제약 설정
- 각각의 View는 상위 뷰와의 간격 조정을 통해 위치, 크기를 설정함
- 또한, View의 너비(Width)는 동일(equal)하게 제약을 설정함

<br>

![Frame 4](https://github.com/onthelots/iOS-Learning/assets/107039500/e23d6161-bde0-476d-85b7-30bbeb84e275)

<br>

`View의 Top, Bottom을 상위 뷰(Superview)와 일정한 간격으로 떨어지도록 설정`
> 해당 경우는 아래와 같은 방정식이 생성됨

```
// Vertical Constraints
// RedView, BlueView 모두 상위 뷰(Superview)와의 제약을 통해 top, bottom layout을 설정
Red.top = 1.0 * Superview.top + 20.0
Superview.bottom = 1.0 * Red.bottom + 20.0
Blue.top = 1.0 * Superview.top + 20.0 // ✅
Superview.bottom = 1.0 * Blue.bottom + 20.0 // ✅
 
// Horizontal Constraints
Red.leading = 1.0 * Superview.leading + 20.0
Blue.leading = 1.0 * Red.trailing + 8.0
Superview.trailing = 1.0 * Blue.trailing + 20.0
Red.width = 1.0 * Blue.width + 0.0

```

### 2️⃣ 인접 뷰(neighborhood)와의 정렬을 통한 제약 설정
- RedView의 Top, Bottom layout을 기반으로 BlueView의 Top, Bottom을 설정

<br>

![Frame 5](https://github.com/onthelots/iOS-Learning/assets/107039500/0c32d19b-d1df-4fb6-898b-bfffac48faff)

<br>

`Top, Bottom Alignment을 통해 인접 뷰간의 관계 생성, 크기 설정`
> 해당 경우는 아래와 같은 방정식이 생성됨

```
// Vertical Constraints
// RedView의 Top, Bottom 위치를 기반(정렬 방식)으로 BlueView 크기 설정
Red.top = 1.0 * Superview.top + 20.0
Superview.bottom = 1.0 * Red.bottom + 20.0
Red.top = 1.0 * Blue.top + 0.0 // ✅ 
Red.bottom = 1.0 * Blue.bottom + 0.0 // ✅
 
//Horizontal Constraints
Red.leading = 1.0 * Superview.leading + 20.0
Blue.leading = 1.0 * Red.trailing + 8.0
Superview.trailing = 1.0 * Blue.trailing + 20.0
Red.width = 1.0 * Blue.width + 0.0
```
