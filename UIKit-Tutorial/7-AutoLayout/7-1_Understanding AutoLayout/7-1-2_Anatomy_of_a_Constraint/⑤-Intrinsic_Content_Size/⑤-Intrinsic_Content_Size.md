# Intrinsic Content Size
`내부 Contents를 바탕으로, View의 크기가 결정된다!`
> 

## Intrinsic Content Size (고유한 컨텐츠의 크기)
- Content란, 즉 UIView를 포함하여 다양한 Class Components(Slider, Label, Button, TextView..)를 의미함
- 즉, 고유한 컨텐츠의 크기(Intrinsic Content Size)에 따라 ➟ UIView의 크기가 결정됨!
- 역으로 생각해 보자면.. UIView는? ➟ 고유한 컨텐츠 크기가 없겠지?

<br>

`Contents와 Intrinsic contents size`
> 각각의 View(Contents)의 고유한 컨텐츠 크기는 어떻게 결정될까?

|View(Content)|고유한 컨텐츠 사이즈|
|---|---|
|UIView and NSView|고유한 컨텐츠 사이즈가 없음|
|Sliders|높이(Height)값은 고정, 너비(width)에 따라 결정|
|Label, buttons, switches, text fields|높이(height)와 너비(width)에 따라 결정|
|Text View, Image View|고유 컨텐츠 크기가 유동적으로 결정|

<br>


## Example Intrinsic Content Size (예시를 살펴보자)
- 프로젝트 참고 (Intrinsic Content Size)

### 🟨 UIView
`고유한 컨텐츠 사이즈가 없으므로, 위치값만으로 제약이 지정되지 않음`
> [위치] 뿐만이 아닌, [크기]를 함께 결정해야 함
> Storyboard 상에서는 placeholder 기능을 통해 임시로 크기와 위치를 설정할 수 있음
<br>
`고유 컨텐츠 값을 지정해주기 위한 방법`
> UIView class를 별도로 생성, [intrinsicContentSize]를 임의로 설정할 수 있음
> 지정하고자 하는 UIView와 해당 Class를 연결하게 된다면, 위치값 만으로도 제약을 설정이 가능해짐
<br>
### 🛹 UISlider
`높이는 이미 결정되어 있기 때문에 너비 값을 지정해야 함`
> 너비(width) 값에 따라 Slider의 컨텐츠 크기가 결정됨
<br>
### 🔤 Label, Button..
`높이, 너비 모두가 고유 컨텐츠의 크기를 결정함`
> Label과 Button 모두 내부 [Text]의 크기나 [Padding] 값에 의하여 고유 컨텐츠 크기를 결정 
