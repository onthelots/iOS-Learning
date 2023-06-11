# Debugging Tricks and Tips
`문제 파악의 시작은 로그를 읽는것`
> 오류 메세지를 해석함으로서 문제 해결 방법 찾아내고 적용할 수 있음 

## Understanding the Logs(로그 이해하기)

### 📓 Sample output from an unsatisfiable layout error
- 오류 발생 시, 출력되는 Log에 대한 정보는 아래 사이트에서 힌트를 얻을 수 있음
- https://www.wtfautolayout.com/

![스크린샷 2023-06-07 오후 10 56 26](https://github.com/onthelots/iOS-Learning/assets/107039500/62dad4c8-f417-44aa-956c-fbb2e44e57c2)


```
// ✅ 발생된 log
2015-08-26 14:27:54.790 Auto Layout Cookbook[10040:1906606] Unable to simultaneously satisfy constraints.
    Probably at least one of the constraints in the following list is one you don't want. Try this: (1) look at each constraint and try to figure out which you don't expect; (2) find the code that added the unwanted constraint or constraints and fix it. (Note: If you're seeing NSAutoresizingMaskLayoutConstraints that you don't understand, refer to the documentation for the UIView property translatesAutoresizingMaskIntoConstraints) 
    
// ✅ 현재 Layout Constraint 상황
(
    "<NSLayoutConstraint:0x7a87b000 H:[UILabel:0x7a8724b0'Name'(>=400)]>",
    "<NSLayoutConstraint:0x7a895e30 UILabel:0x7a8724b0'Name'.leading == UIView:0x7a887ee0.leadingMargin>",
    "<NSLayoutConstraint:0x7a886d20 H:[UILabel:0x7a8724b0'Name']-(NSSpace(8))-[UITextField:0x7a88cff0]>",
    "<NSLayoutConstraint:0x7a87b2e0 UITextField:0x7a88cff0.trailing == UIView:0x7a887ee0.trailingMargin>",
    "<NSLayoutConstraint:0x7ac7c430 'UIView-Encapsulated-Layout-Width' H:[UIView:0x7a887ee0(320)]>"
)
 
// ✅ 오류가 발생하는 지점
Will attempt to recover by breaking constraint
<NSLayoutConstraint:0x7a87b000 H:[UILabel:0x7a8724b0'Name'(>=400)]>
 
Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.
The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKit/UIView.h> may also be helpful.
```

---

## Adding Identifiers to the Logs(로그 확인을 위한 식별자 추가하기)

###  🔠 Identifiers(식별자) 활용
- 로그에 작성되는 다양한 콘텐츠(Components)들의 이름(name tag)을 할당함으로서, 보다 쉽게 오류를 확인할 수 있음
- 아래와 같이, 해당 콘텐츠 뿐만이 아니라 [제약] 자체에도 Identifiers를 할당할 수 있음

<br>

`콘텐츠(Components)의 식별자`
![Frame 20](https://github.com/onthelots/iOS-Learning/assets/107039500/af191802-774c-4235-ab4b-168524ba6fe0)

<br>

`제약(Constraints)의 식별자` 
![Frame 21](https://github.com/onthelots/iOS-Learning/assets/107039500/ce71aff7-7fbc-42f2-81c1-a8eace38a74a)


---

## Visualizing Views and Constraints (뷰의 모습과 제약의 비주얼화)
### 📐 view hierarchy(뷰의 계층구조)
- 구성된 형태의 전반을 확인하는 [계층구조]를 통해 각각의 요소들의 제약과 크기를 확인할 수 있음
- Build 후, [Debug View Hierarchy] 버튼을 눌러 확인할 수 있음
![스크린샷 2023-06-07 오후 11 24 48](https://github.com/onthelots/iOS-Learning/assets/107039500/f19ca691-346a-46f6-855a-a256ee29ad4f)

