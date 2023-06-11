# Attributes(속성)과 Equations(방정식)

## 수식과 함께 예시로 살펴보는 Constraint
- 여기서 Layout을 잡아주고자 하는 뷰는 'RedView'임
- 단순하게 수식 살펴보자면..
    - RedView는 BlueView의 오른쪽(trailing) 방향에서부터 8 point가 떨어저야 한다는 것을 직관적으로 이해할 수 있음
    - 그렇다면, 각각의 Attributes(속성)은 어떤 의미를 가지고 있을지 이해할 필요가 있음
    
<img width="684" alt="스크린샷 2023-06-06 오후 4 54 27" src="https://github.com/onthelots/Projects/assets/107039500/f6523b86-4e85-42af-8ec6-2f25693ed979">



## AutoLayout의 Attributes
- 다양한 Attributes가 존재함
- 왜 Leading과 Trailing이라고 하는데?
    > 이는, '글이 시작하는 방향'에 따른 사항임.  
    > 미국에서는 왼쪽에서 오른쪽으로 글을 읽고 있음(왼쪽이 '선행'하며, 오른쪽이 '후행'하는 것으로 인식함)   
    > 따라서, 여기서도 왼쪽의 명칭을 Left가 아닌 'Leading'으로 사용하며, 오른쪽은 자연스레 'Trailing'으로 사용함.   
    > ⁉️ 만약, Apple이 중동지역에 위치한 나라의 회사였다면? : 왼쪽을 'Trailing'으로 사용했을 것임
   
<img width="680" alt="스크린샷 2023-06-06 오후 4 55 06" src="https://github.com/onthelots/Projects/assets/107039500/fc07d70f-66e9-48e6-8202-6497d67e5509">

<br>

### Baseline이란?
  - '글자'의 맨 아랫, 끝나는 지점 (HIG에서 자세하게 살펴볼 수 있음)
    
### 🥸 Attributes의 종류 (Basic type of attributes)
  - Size(크기) Attributes : Width, Height
  - Location(위치) Attributes : Top, Bottom, Left, Right, Center Y, Center X 
    
### 👆🏻 Attributes의 필요성
  - 결과적으로, 제약(Constraint)을 설정하기 위한 일종의 요소임

### 🔍 Attributes의 규칙
  - 1. [Size attributes]와 [location attributes]는 함께 사용할 수 없다.</p>
  - 2. [location attributes]는 상수값(constant)으로 설정할 수 없다(기준이 되는 View가 반드시 존재하고 이에 따른 위치값이 설정이 되어야 한다).</p> 
  - 3. [location attributes]는 [multiplier]로 1.0 이외의 값을 사용할 수 없다. </p> 
  - 4. [vertical attributes]와 [horizontal attributes]는 서로에게 제약(Constraint)을 할 수 없다. </p> 
  - 5. [Leading]을 다른 뷰의 [왼쪽(Left)속성]에, [Trailing]을 다른 뷰의 [오른쪽(Right) 속성]에 제약할 수 없다. </p> 

### ✅ Sample equations for a variety of common constraints.

```
// Setting a constant height
// height는 단순한 Size attributes 이므로, Attributes를 설정하지 않아서 multiplier는 0.0.
View.height = 0.0 * NotAnAttribute + 40.0
 
// Setting a fixed distance between two buttons
// Button_2는, Button_1의 오른쪽(trailing)에서 8 point 만큼 떨어져 있다.
Button_2.leading = 1.0 * Button_1.trailing + 8.0
 
// Aligning the leading edge of two buttons
// Button_1의 왼쪽(leading)은, Button_2의 왼쪽(leading)과 정렬(Alignment)되어 있다.
Button_1.leading = 1.0 * Button_2.leading + 0.0
 
// Give two buttons the same width
// Button_1과 Button_2의 너비(width)는 동일하다.
Button_1.width = 1.0 * Button_2.width + 0.0
 
// Center a view in its superview
// 하위 뷰(View)의 centerX 값은, 상위 뷰(Superview)의 centerX값과 동일하므로, 한 가운데 위치한다.
View.centerX = 1.0 * Superview.centerX + 0.0
View.centerY = 1.0 * Superview.centerY + 0.0
 
// Give a view a constant aspect ratio
// 특정 View의 높이(height)는, 해당 View의 너비(width)보다 2배 크다.
View.height = 2.0 * View.width + 0.0

```

### ⁉️ Equality, Not Assignment!
  - 일반적으로 할당 연산자(=)는 오른쪽의 값을 왼쪽에 할당하는 것으로 사용해옴
  - 하지만! AutoLayout은 동등성, 즉 오른쪽 값과 왼쪽 값이 동일한 값이어야 함
  - 그렇지 않을 경우, 발생하는 것이 바로 [빨간색]으로 표시되는 AutoLayout 오류임.
