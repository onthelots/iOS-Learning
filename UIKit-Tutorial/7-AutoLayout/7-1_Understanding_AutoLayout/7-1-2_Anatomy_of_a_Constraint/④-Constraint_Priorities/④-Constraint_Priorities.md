# Constraint Inequalities
`선택적인 제약조건을 바탕으로, 모든 제약조건을 만족시키는 Layout을 구성`
> 현재까지 학습한 예제는, 모두 제약조건을 등식(=)으로 표현했지만, 부등식(⁉️)으로도 나태낼 수 있음

## Inequalities (부등식)
- 부등식 제약조건은 등호(=)와 함께 이상(크거나 같음), 이하(작거나 같음)를 사용할 수 있음
- 일종의 [가능한 값의 범위]를 제한하고 있으며, 추가적인 제약 조건이 필요할 수 있음

<br>

`최소, 최대의 크기 제약이 설정된 View`
> 2개의 부등식을 활용하여 View의 폭(width)의 값을 제약하고 있음

```
// 최소 폭 설정
View.width >= 0.0 * NotAnAttribute + 40.0 // ✅ View의 너비는, 40.0보다 크구나!

// 최대 폭 설정
View.width <= 0.0 * NotAnAttribute + 280.0 // ✅ View의 너비는, 280.0보다 크구나!
```

<br>


# Constraint Priorities (제약 우선순위)
`우선도에 따른 제약 설정`
> 제약과의 경쟁 관계를 설정함으로서 유동적인 Layouts을 만들 수 있다?!

## Priorities (우선순위)
- 앞서 부등식, 즉 [범위값]에 대한 제약을 통해 우리는 [선택적인 제약]을 설정할 수 있음
- 범위값 이외, 우선순위(Priorities)에 따라 유동적인 Layouts을 구성할 수도 있음

<br>

`RedView와 YellowView의 간격에 대한 2가지 제약이 발생할 경우`
> 아래와 같이 2개의 View간의 간격을 20p, 100p 로 중복하여 설정할 경우?
> Conflicting Constraints (제약 충돌) 문제가 발생하게 됨

![Frame 6](https://github.com/onthelots/iOS-Learning/assets/107039500/1074b634-0c40-44d3-90f1-49e0a0bb2455)


<br>

`제약의 우선순위를 설정해보면 어떨까?`
> 이를 해소하기 위해, 각각의 제약 간의 우선순위를 설정하게 된다면 오류가 발생하지 않음
> 아래의 경우, [100p 간격 재약]에 낮은 우선순위(Priority 250)를 설정한 경우임

![Frame 7](https://github.com/onthelots/iOS-Learning/assets/107039500/eaa7990e-95c8-467c-82d0-ccf8a88ddbbd)



