# iOS 앱에서의 View는?
- 앱의 데이터를 사용자에게 보여주거나 알림
- 사용자의 피드백과 인터렉션을 앱에 알리거나, 저장하는 역할

<br> 

# View를 그리는 방식의 변화
- **Code** : 단순한 코드로서 UI, View를 그리는 방식
- **Nib** : NexT Interface Builder / 화면을 구성하는 클래스들을 바이너리 형태의 압축파일로 저장, 활용
- **Xib** : Xml Inferface Builder / Nib와는 기능적으로 동일하나, SCM(소스제어관리)시스템의 효율성을 높인 버전
특히나, Xml 문법에 맞춰 저장되므로, 수정된 부분을 알 수 있어 소스코드로서 관리가 가능함. 수정 시 Xcode에서는 Interface Builder를 제공, XML 형태가 아닌 그래픽 형태로서 수정할 수 있도록 도와줌
- **Storyboard(UIKit)** : Xib와 바이너리 형태의 Nib의 정보가 담겨진 plist파일이 패키지된 정보 파일
--- 
<p> 🔎 Nib, Xib, Storyboard 모두 파일형태로 구성되어 있으며,  
MVC 디자인 패턴을 위해 View와 Controller를 분리하기 위한 목적으로 만들어진 파일임 </p>

<p> 🔎  Storyboard 파일이 컴파일 되면, .storyboardc로 변환되며 xib가 빌드 후 nib로 변경됨. 이후 해당 파일은 App Bundle(앱 파일이 저장된 디렉토리)에 저장됨 </p>


<p> 🔎 xib와 Storyboard의 가장 큰 차이점은, 바로 '실행 흐름'을 제어할 수 있다는 점임. View에서 View로의 전환을 할 수 있도록 실현한 것이 바로 Storyboard </p>

---

- SwiftUI(2019) :  Swift 언어의 프로그래밍 패러다임에 부합하는 View Builder


<br> 

![Group 1791](https://user-images.githubusercontent.com/107039500/223926873-c24633ae-0f51-4899-81d9-01c3b7a9eee9.png)

<br> 

# View Builder에 대한 고찰
- 새로운 기술인 SwiftUI에 대하여 지속적으로 학습할 필요가 있음
- 대 다수의 기업에서는 UIKit 기반 프로젝트를 진행하고 있기 때문에 UIKit 또한 습득해야 함
