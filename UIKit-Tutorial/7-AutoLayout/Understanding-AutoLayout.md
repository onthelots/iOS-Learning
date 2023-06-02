# AutoLayout에 대한 이해

## 📓 공식문서에서 소개하는 AutoLayout
https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html
- 'AutoLayout이란, 화면(View)의 크기와 위치를 제약(Constraint)을 통해 동적으로 계산해 주는 것'
- '궁극적으로 Dynamically, 즉 동적으로 화면(View)을 변경하기 위한 것'

### 외부적 변화(External Change)에서 필요한 AutoLayout의 예시
- Split View (iPad)
- Device rotates (iOS)

### 내부적 변화(Internal Change)에서 필요한 AutoLayout의 예시
- 앱 내부에서, 사용자가 버튼을 누르거나 드래그를 할 경우 발생하는 변화
- Dynamic Type (iOS)


## ✂️ AutoLayout의 필요성
- 과거엔 절대적인 수치, 즉 Frame-Based Layout이라는 좌표계 시스템을 활용하여 레이아웃을 진행함
- 하지만, 다양한 Device가 등장함에 따라 좀 더 유동적인 레이아웃을 구성하는 방식이 필요함



