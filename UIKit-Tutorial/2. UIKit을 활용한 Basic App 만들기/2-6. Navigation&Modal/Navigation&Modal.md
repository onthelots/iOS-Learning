# Navigation & Modal

## 🔍네비게이션과 모달의 역할
- 각 기능은, 단일한 View가 아닌 여러 View를 통해 사용자에게 정보를 제공함
- 즉 '화면 전환'이 필요하며, 이와 같은 역할을 담당하는 것이 바로 네비게이션과 모달


## 🙏HIG(Human Interface Guideline) 내 화면전환 기능 소개

### Modality (Modal)
    - 사용자로 하여금 특정 컨텐츠에 대한 집중을 요구하기 위한 기능
    - ex. Alert(알림), 삭제/취소, 특정 위치에서 올라오는 창
    
### Navigation
    - 사용자가 앱의 기능을 탐색할 때, 지속적으로 타고 들어가는 형태의 기능
    - 네비게이션을 사용할 시, 사용자가 당황하지 않게 지나온 곳을 다시 돌아갈 수 있게 도와주는 것이 중요함



## ① Modality (Modal)
- iOS에서 제공하는 시스템 모달은 크게 아래와 같이 4가지로 구분됨
    - alert : 삭제/취소, 허용/비허용 
    - activity views : sharing activities. 사용자 간의 공유, AirDrop, Message, Mail로의 공유
    - share sheet : activity views와 유사한 기능을 제공. 해당 context에서 벗어나지 않고 하단에 표현 (사진앱)
    - action sheet : 사용자가 직접 선택할수 있도록 일종의 'selected Button'을 제공하는 modality

- 개발자가 직접 custom할 수 있는 Modal도 존재함
    - automatic : PageSheet 형태로, 시스템이 자동으로 설정(디폴트는 automatic으로 설정되어 있음)
    - fullscreen : 화면에 꽉 차는 PageSheet (.fullscreen)
    - 그 외 form sheet, popover 등의 모달이 존재함

- 어떻게 구현하나? 👋🏻
    - ViewController의 present(_:animated:complection:) 메서드를 활용함
    

## ② Navigation
- 네비게이션은 크게 3가지 형태로 구분됨
- Hierachical Navigation
    - 화면에서 선택 후 다음 화면으로 (ex. 설정앱)
    - 🟠 ➟ 🟠 ➟ 🟠
    
- Flat Navigation
    - 탭바를 주로 사용함으로서, 여러 콘텐츠 카테고리로 나뉘는 형태 (ex. 앱스토어)
    - 🔵 ⇿ 🔵 ⇿ 🔵 

- Content-Drive or Experience-Driven Navigation
    - 콘텐츠 자체가 '네비게이션 스타일'을 정의하는 형태 (ex. 게임)

<br>

## 주요 원칙
- 사용자가 이동경로를 명확하고, 쉽게 파악할 수 있도록 로직을 구성해야 함!
- SwipeBack과 같이, 사용자의 제스쳐를 이용할 수 있도록 함!
- NavigationBar 혹은 Tapbar를 활용하여 현재 어느 위치(Context)에 있는지 표기해야 함!
- 구현은, TabbarController와 NavigationController로 충분히 가능!


## 참고
- https://developer.apple.com/design/human-interface-guidelines/ios/app-architecture/navigation/ (Navigation)
- https://developer.apple.com/design/human-interface-guidelines/ios/app-architecture/modality/ (Modality)

