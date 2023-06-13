# How to use Scroll View?
`유동적인 사이즈를 지닌 ScrollView를 어떻게 사용할까`
> 다양한 View Class(Components)를 담아내는 ScrollView

## Step 1. ScrollView의 Content를 지정 
- ScrollView는 말 그대로 '스크롤'되어 보이는 유동적인 성격을 가지고 있음
- 하지만, AutoLayout을 지정하기 위해선 '크기' 혹은 '위치' 속성이 반드시 필요함
- ✅ 따라서! ScrollView의 속성을 지정해 줄 내부 콘텐츠(뷰)를 생성해야 함
- ❌ 콘텐츠의 크기가 모호하므로, 제약 오류는 여전히 존재함

![Frame 31](https://github.com/onthelots/iOS-Learning/assets/107039500/de3d1e27-73cf-4e9b-99d1-5a68169444b4)

<br> 

## Step 2. ScrollView와 ContentView와의 관계 설정
- ScrollView의 속성에 따라, '세로' 혹은 '가로' 스크롤을 선택할 필요가 있음
- 이를 위해 내부 콘텐츠(뷰)는 ScrollView와의 Width, height에 대한 equal 설정을 진행해야 함
- ✅ 세로(Vertical) 스크롤일 경우엔 equal Width, 가로(Horizontal) 스크롤일 경우엔 eqaul Height
- ❌ 하지만 여전히 [Y position] 제약오류는 발생함

![Frame 32](https://github.com/onthelots/iOS-Learning/assets/107039500/752514d2-148b-4976-b79f-afbd50133829)

<br> 

## Step 3. ContentView의 크기 설정
- UIView, 여기서는 ContentView라는 명칭의 뷰의 크기를 설정하기 위해, 내부에 요소(Components)를 할당함
- 이때, 해당 UIView는 Intrinsic Content Size(고유한 컨텐츠의 크기)가 존재하지 않으므로, 임의의 Label을 통해 크기를 지정함
- ✅ ScrollView의 [Y position]이 최종적으로 설정됨에 따라 제약 오류가 사라졌다! 

![Frame 33](https://github.com/onthelots/iOS-Learning/assets/107039500/f6f3142a-c7cd-4deb-8e63-6f600ba9d134)

<br> 


## Step 4. Content Layout Guide, Frame Layout Guide

### Content Layout Guide
`ScrollView 내부 콘텐츠의 크기에 대한 가이드`
- [Step 2]에 이어서, ContentView 내부에 임의의 Label을 생성한 후 화면 바깥까지 나가도록 늘여쓴다면?
- Content Layout Guide를 클릭할 시, 콘텐츠의 크기가 파란색 범위로 나타나는 것을 확인할 수 있음
- ✅ 즉, Content Layout Guide는 내부 컨텐츠의 개략적인 크기 혹은 범위를 확인할 수 있는 도구

![contentLayoutGuide](https://github.com/onthelots/iOS-Learning/assets/107039500/2195ceaa-496c-466c-8547-2af16f6b93b6)


<br> 

### Frame Layout Guide
`반드시 고정되어야 하는 속성, 혹은 콘텐츠`
- 만약, 특정 요소가 Content Layout에 따라 스크롤 되지 않고 고정되어야 한다면?
- 특정 요소와 Frame Layout Guide와의 제약(Constraints) 관계를 설정함

![frameLayoutGuide](https://github.com/onthelots/iOS-Learning/assets/107039500/d7d5ffdb-606a-4f24-b282-5af500500ee1)

