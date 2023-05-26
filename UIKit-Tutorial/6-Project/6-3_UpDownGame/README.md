# 📱UpDownGame

## To-Do List (무엇이 필요할까?)
### Slider 
    - Slider 생성
    - Slider의 최대값 설정 (어디부터, 어디까지 증가시킬 수 있나?)

### Random Number (Variable) 
    - 해당 Slider의 수치 범위 내 랜덤 값 생성
    
### Game Result
    - 사용자가 선택한 Slider 값과 Random Number간의 일치 여부 파악
    - Correct or failue 여부 나타내기
    
### Game Reset
    - Game Reset -> Slider 위치, 랜덤 값(Varible) 초기화


### 기타 UI Components
    - 게임 타이틀
    - 앱의 정보(i) 버튼 -> Tap 시 새로운 정보창으로



## 우선순위 및 구현방식
### View 구성방식 (1안 : 하나의 View, 2안 : NavigationItem)
    - 상단의 버튼(Game Info, Game Reset) 및 중앙에 위치한 타이틀을 어떻게 표현할 것인가?
    - 구상중..

### 내부 UI 및 컴포넌트 배치
    - Slider를 Verical Center로 배치할 경우..
    - Vertical Stack을 활용, 3개의 하위 View를 구성한 후 동일한 Spacing 적용, 컴포넌트 배치

### UISlider
