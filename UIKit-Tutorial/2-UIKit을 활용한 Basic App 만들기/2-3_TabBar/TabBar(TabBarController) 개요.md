# TabBar(TabBarController) 개요

## TabBar란?
- 상단 혹은 하단에서 다른 View로 이동할 수 있도록 하는 구조 (필수 구현 Skill)
- 당근마켓, 인스타그램, 토스 외 다양한 큰 규모의 Application은 채택해서 활용

## TabBar의 기능 (TabBarController)
- 앱에서 더 많은 View를 사용자에게 보여주고자 함
- 따라서, 컨텐츠가 많은 슈퍼앱의 기본조건이 바로 TabBarController임

## TabBar 구현 방법
- UITabbarController를 활용하여 구현함
- 이는, 다양한 ViewController를 사용할 수 있도록 함
    - setViewController() 메서드를 활용하여 코드로 
- selectedIndex를 통해 특정 ViewController의 선택 여부를 확인할 수 있음
- TabBar의 Item은(image, Title) UITabBarItem으로 구성할 수 있음

## 참고
- https://developer.apple.com/documentation/uikit/uitabbarcontroller

