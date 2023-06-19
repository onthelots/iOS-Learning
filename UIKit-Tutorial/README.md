# 🔵 UIKit-Tutorial

## 1. iOS 앱 개요
      - 앱의 동작원리(LifeCycle)
      - View의 역할과 Drawing 방식

<br>

##  2. UIKit을 활용한 Basic App 만들기
  ### 2-1. UIKit 기초
      - Storyboard 생성하기
      - AutoLayout 살펴보기
      - [프로젝트1] SymbolRoller (SFsymbols와 UIImage, UILabel, UIButton을 활용한 랜덤 이벤트 구현)
      - [프로젝트2] SimpleWeather (UIStackView를 활용한 날짜별 도시별 랜덤 이벤트 구현)
      
  ### 2-2. List와 Grid
      - 리스트와 그리드 구현하기
      - [프로젝트3] StockRank (UICollectionView를 활용한 주식 리스트 구현)
      - [프로젝트4] Chatlist(UICollcectionView, awakeFromNib(), DateFormatter(), MVC 구조를 활용한 채팅 리스트 구현)
      - [프로젝트5] AppleFramework(UICollectionView의 UICollectionViewLayout 사용자 지정을 통한 Grid 형식의 View 구현)
      
  ### 2-3. TabBar
      - TabBar(TabBarController) 개요
      - [프로젝트6] InstagramSearchView(UITabbarController를 활용한 View연결, UINavigationController > NavigationBarItem 생성, UISearchController 등)
          
### 2-4. PageView
      - [프로젝트7] NikeOnboarding (UICollcetionView와 UIPageControl 컴포넌트의 연결, Vertical ScrollView 구현)
             
### 2-5. DiffableDataSource
      - [프로젝트8] AppleFramework(DiffDataSource와 CompositionalLayout을 활용한 기존 프로젝트 개선하기)
      - [프로젝트9] HeadSpaceFocus(estimated 수정자를 활용한 동적 LayoutSize 조정 외 Layout 구성전반 학습, IBAction을 활용한 Data(snapshot) 업데이트)
      - [프로젝트10] SpotifyPaywall(DiffDataSoruce 및 CompositionalLayout 심화기능 학습, UIPageControl 연결, visibleItemsInvalidationHandler 인덱싱)
     
### 2-6. Navigation & Modal
      - Navigation & Modal 개요
      - [프로젝트11] AppleFramework Modal (Modality 구현을 위한 새로운 Storyboard 생성, 기존 ViewController 내 Delegate 선언과 Present 수정자를 통한 modal 띄우기)
      - [프로젝트12] HeadSpaceFocus Navigation(2개 이상의 Section 생성 및 활용, NavigationController, pushViewController메서드를 통한 Navigation 기능구현)
 
<br>

##  3. Combine
### 3-1. Combine 기초
      - Combine이란? (Combine 및 동기/비동기 개념)
      - Combine의 컴퍼넌트 (Publisher, Subscriber, Operator)
      - Hello, Combine (Publisher 및 Subscriber 선언 / Subject / Subscription / @Published / Foundation&Combine / Scheduler / Operation 활용)
      
### 3-2. Combine 실습
      - [프로젝트13] AppleFramwork_Combine (Combine을 활용한 코드 리팩토링)

<br>
      
##  4. Network
### 4-1. 네트워크 이해하기 (Concurrency / Thread / Async&Sync Task / HTTP)
      - URLSession, URLSession+Combine
### 4-2. Network_app
      - [프로젝트14] GithubUserProfile (UISearchController를 기반으로 네트워크 데이터 decoding, kingfisher를 활용한 Github avatarUrl 이미지 가져오기)
      - [프로젝트15] GithubUserSearch (URLComponents 및 URLQueryItem, URLSession의 publisher화를 통한 Combine 활용 / Network 객체 생성을 바탕으로 코드 리팩토링)
 
<br>
    
##  5. MVVM
### 5-1. MVVM의 개념 (vs MVC 패턴)
### 5-2. MVVM_app
      - [프로젝트16] AppleFramework_Combine-MVVM
      - [프로젝트17] GithubUserProfile-MVVM
      - [프로젝트18] GithubUserSearch-MVVM
### 5-3. 디자인 패턴 (feat. Clean Architecture)
      - MVVM 이외 디자인 패턴

<br>

##  6. Project
### 6-1. TossBenefitTab (토스 혜택앱)
      - [프로젝트19-1] TossBenefitTab (Combine, NetworkService 생생, MVVM 패턴 구조 완성)
      - [프로젝트19-2] TossBenefitTab (포인트 별 Detail View 생성 및 Navigation 연결, AutoLayout 설정)
### 6-2. CarrotHomeTab (당근마켓 클론앱)
      - [프로젝트20-1] CarrotHomeTab (Combine, NetworkService 생생, Custom UITabBarItem 활용, NavigationBar 만들기)
      - [프로젝트20-2] CarrotHomeTab (AutoLayout 설정, UIScrollView 활용, 프로젝트 완성)
### 6-3. UpDownGame (숫자 맞추기)
      - [프로젝트21] UpDownGame (UISlider, 단순 Segue를 활용한 Modality 구현 외)

<br>

##  7. AutoLayout
### 7-1. Understanding AutoLayout (오토레이아웃이란?)
        - AutoLayout의 필요성, Attributes(속성) & Equations(방정식)
        - Creating Nonambiguous Layout, Variety Solutions(실습)
        - Constraint Inequalities(부등식을 활용한 선택적 제약조건)
        - Constraint Priorities (제약 우선순위)
        - Intrinsic Content Size(고유한 컨텐츠의 크기)
        - CHCR (Compression-Hugging과 Compression-Resistance)
        
### 7-2. StackView (Stackview Basis)
        - Understanding StackView (StackView의 속성과 요소들)
        
### 7-3. Debugging AutoLayout (오토레이아웃 디버깅)
        - Types of Errors (Unsatisfiable Layouts, Ambiguous Layouts, Logical Errors)
        - Debugging Tricks and Tips, Adding Identifiers to the Logs
        
### 7-4. Constraints with Code (코드로 제약 설정하기)  
        - Layout Anchors (제약이 필요한 item의 Anchors property 접근방식)
        - NSLayoutConstraint (constraint instance를 활용, 두 UI간의 관계 설정방식)
        
### 7-5. Dynamic Stack View (Stackview advance)  
        - addArrangeView (Stack내 View 추가), @Objc func 및 addTarget을 활용한 Target Action 활용
        
### 7-6. Size Classes (크기가 다른 디바이스 별, 동일한 Storyboard 사용방법)
        - Compact & Regular
        - Size Class가 사용되는 경우
        
### 7-7. Scroll View (스크롤뷰)
        - The basis (내부 콘텐츠와의 제약관계를 설정, Content Layout Guide, Frame Layout Guide을 통한 스크롤 뷰 활용)
        - Dynamic Scroll View (코드 활용한 Label 추가 및 삭제 기능 구현 / animation 효과 적용)
    
### 7-8. Dynamic Type (accessbility, 즉 접근성을 구현하기 위한 방식)
        - 코드를 활용하여 구현하기 (preferredFont)
        - AutoLayout Inspector를 통하여 구현하기 (Automatically Adjusts Font) 
    
### 7-9. Projects
        - LoginView (UIScrollView, UIStackView를 활용한 로그인 창 구현, Dynamic Type 및 AutoLayout 적용)
        - Floationg Buttons (커스텀 UIButton 생성, Damping 애니메이션을 활용한 Floationg 기능 구현)
        - Social_Media_Table (Code-Base UITable Layout 작성, NotificationCenter 및 Model(Assets Data)을 활용한 피드화면 기능 구현)
        - Messaging_Table (2개의 UITableCell을 활용한 '채팅창' 구현. UIResponsder를 통한 유연한 채팅작성(TextField) 및 키보드 Show&Hidfe 기능 구현)
        - Bar_Graph (하나의 화면에서 각각의 UIStackView, UIScrollView를 활용, Horizontal 형식의 Bar 그래프 구현 - Code + AutoLayout)
        - Social_Media_Profile (UIScrollView를 활용한 Dynamic Image View 효과 구현, SNS 프로필 화면 구상)
        
