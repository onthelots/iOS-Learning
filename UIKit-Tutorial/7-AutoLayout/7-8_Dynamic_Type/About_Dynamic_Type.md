# Dynamic Type
`accessbility, 즉 접근성을 구현하기 위한 방식`
> Dynamic Type의 활용을 통해 모든 사용자들이 접근하기 쉬운 어플리케이션으로

> 참고 : https://developer.apple.com/design/human-interface-guidelines/typography#Specifications

## 왜 필요한데?
- 모든 사용자가 시력이 같지 않기 때문에 폰트의 크기를 조정하여 [동적 사이즈]를 스스로 구현함
- 그런데, 만약 특정 요소(Components)의 동적 사이즈가 고정되어 있을 경우엔 '접근성' 측면에서 문제가 발생함

## 어떻게 적용하는데?
- [코드]로 작성하는 방식, 그리고 [AutoLayout Inspector]에서 설정할 수 있음
- 특히, AutoLayout에서 요소를 직접 사용할 경우, Dynamic Type을 반드시 설정할 필요가 있음


### 1️⃣ 코드로 작성할 때 (preferredFont)
`label(text)의 Font의 Dynamic Type을 지정하는 예시`

```
let helloLabel = UILabel()

// 해당 Label의 폰트 스타일을 설정 (largeTitle로 설정)
helloLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)

// 사용자의 접근성 설정에 따라 폰트를 자동으로 Re-sizing 하기 위한 프로퍼티 (true)
helloLabel.helloLabel.adjustsFontForContentSizeCategory = true
```

<br> 

`2개 Button의 Font의 Dynamic Type을 지정하는 예시`
> Button의 경우, Label과는 달리 Automatically Adjusts Font 메뉴가 존재하지 않으므로, 코드로 작성 필

![Frame 35](https://github.com/onthelots/iOS-Learning/assets/107039500/69e9f3eb-8f05-4bb1-8f00-90037f5da042)

<br> 

### 2️⃣ AutoLayout Inspector를 활용할 때 (Automatically Adjusts Font) 
`해당 버튼을 체크하게 되면, 자동으로 Accessibility가 적용됨`

![Frame 34](https://github.com/onthelots/iOS-Learning/assets/107039500/7bacdf56-3a62-4595-8f5e-216efe6c0b7c)

<br> 



## Accessbility Inspetor (test)
- 🚫 font slider option이 나타나지 않는 문제 발생
