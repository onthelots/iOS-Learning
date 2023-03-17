# 앱은 어떻게 동작하는가?
- 앱은 항상 사람들의 관심을 기다린다.
- 사용자가 특정 앱을 실행할 경우, 시스템은 해당 앱에 리소스를 몰아준다 (foreground)
- 이후, 사용을 하지 않는다면 자연스레 앱은 background 상태로 변화된다.
- 이러한 과정이 바로 앱의 'LifeCycle'이다.


## LifeCycle의 이해

**1. 과거 앱 라이프 사이클**
- 앱을 실행하는 과정 : Not Running ➟ Inactive(Launch Screen UI) ➟ Active(App UI) 
- 앱을 종료하는 과정 : Active ➟ Inactive ➟ Background
- 앱을 장시간 사용하지 않는 경우 : Suspended (리소스를 더이상 할당하지 않음)

**2. 과거 라이프 사이클의 구분**
- 'App Delegate'라는 클래스는 앱의 전반적인 LifeCycle을 담당하며, 아래와 같이 2가지 종류로 구분되었음
- Process Lifecycle : 앱을 실행하고, 삭제하는 과정
    - App Launched, App Terminated
- UI LifeCycle : 앱 자체가 Foreground에 진입하거나, Active한 상태가 되는 과정
    - Entered Foregorund, Became Acitve 등


**3. iOS 13 이후의 라이프 사이클**
- 기존의 iOS 라이프 사이클의 경우, '앱 하나 - 화면 하나' 형태였다면..
- iOS 13버전 이후, 일종의 '멀티 윈도우'를 제공하게 됨 (다수의 UI LifeCycle이 생성)
- 그렇게 되니.. 하나의 AppDelegate에서 전부 담당하는 것은 비 효율적이라 판단되어 분리를 실시하게 됨
- App Delegate
    - Process Lifecycle (App Launch, App Terminated)
- Scene Delegate (👋🏻 New!)
    - UI Lifecycle (Entered Foregorund, Became Acitve)


**4. SceneDelegate의 역할**
- 멀티 윈도우를 제공하니, 아래와 같은 과정이 한 앱에 여러번 실행될 수 있음!
- Scene을 실행하는 과정 : Unattached(실행전) ➟ Foreground Inactive(Launch Screen UI) ➟ Foreground Active(App UI)
- Scene을 종료하는 과정 : Foreground Inactive ➟ Background ➟ Suspended


**5. 개발자가 고려해야 할 주요사항**
- Foreground Inactive 과정 : 이니셜UI나 Interaction을 준비하는 과정을 거쳐야 함
- Foregound를 떠날 때 : 주요한 Data를 저장하며, 앱의 작업을 최소화할 준비를 해야 함
- Background에 진입할 때 : 앱의 전반적인 작업을 중단하고, Memory를 비워야 함


**6. 참고**
https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle
