# 🔵 UIKit-Tutorial

### 1. iOS 앱 개요
      - 앱의 동작원리(LifeCycle)
      - View의 역할과 Drawing 방식


###  2. UIKit을 활용한 Basic App 만들기
    2-1. UIKit 기초
      - Storyboard 생성하기
      - AutoLayout 살펴보기
      - [프로젝트1] SymbolRoller (SFsymbols와 UIImage, UILabel, UIButton을 활용한 랜덤 이벤트 구현)
      - [프로젝트2] SimpleWeather (UIStackView를 활용한 날짜별 도시별 랜덤 이벤트 구현)
      
    2-2. List와 Grid
      - 리스트와 그리드 구현하기
      - [프로젝트3] StockRank (UICollectionView를 활용한 주식 리스트 구현)
      - [프로젝트4] Chatlist(UICollcectionView, awakeFromNib(), DateFormatter(), MVC 구조를 활용한 채팅 리스트 구현)
      - [프로젝트5] AppleFramework(UICollectionView의 UICollectionViewLayout 사용자 지정을 통한 Grid 형식의 View 구현)
      
    2-3. TabBar
      - TabBar(TabBarController) 개요
      - [프로젝트6] InstagramSearchView(UITabbarController를 활용한 View연결, UINavigationController > NavigationBarItem 생성, UISearchController 등)
          
    2-4. PageView
      - [프로젝트7] NikeOnboarding (UICollcetionView와 UIPageControl 컴포넌트의 연결, Vertical ScrollView 구현)
             
    2-5. DiffableDataSource
      - [프로젝트8] AppleFramework(DiffDataSource와 CompositionalLayout을 활용한 기존 프로젝트 개선하기)
      - [프로젝트9] HeadSpaceFocus(estimated 수정자를 활용한 동적 LayoutSize 조정 외 Layout 구성전반 학습, IBAction을 활용한 Data(snapshot) 업데이트)
      - [프로젝트10] SpotifyPaywall(DiffDataSoruce 및 CompositionalLayout 심화기능 학습, UIPageControl 연결, visibleItemsInvalidationHandler 인덱싱)
     
    2-6. Navigation & Modal
      - Navigation & Modal 개요
      - [프로젝트11] AppleFramework Modal (Modality 구현을 위한 새로운 Storyboard 생성, 기존 ViewController 내 Delegate 선언과 Present 수정자를 통한 modal 띄우기)
      - [프로젝트12] HeadSpaceFocus Navigation(2개 이상의 Section 생성 및 활용, NavigationController, pushViewController메서드를 통한 Navigation 기능구현)
      

###  3. Combine
    3-1. Combine 기초
      - Combine이란? (Combine 및 동기/비동기 개념)
      - Combine의 컴퍼넌트 (Publisher, Subscriber, Operator)
      - Hello, Combine (Publisher 및 Subscriber 선언 / Subject / Subscription / @Published / Foundation&Combine / Scheduler / Operation 활용)
      
    3-2. Combine 실습
      - [프로젝트13] AppleFramwork_Combine (Combine을 활용한 코드 리팩토링)
      
      
###  4. Network
    4-1. 네트워크 이해하기 (Concurrency / Thread / Async&Sync Task / HTTP)
      - URLSession, URLSession+Combine
    4-2. Network 실습
      - [프로젝트14] GithubUserProfile (UISearchController를 기반으로 네트워크 데이터 decoding, kingfisher를 활용한 Github avatarUrl 이미지 가져오기)
      - [프로젝트15] GithubUserSearch (URLComponents 및 URLQueryItem, URLSession의 publisher화를 통한 Combine 활용 / Network 객체 생성을 바탕으로 코드 리팩토링)
    
    
###  5. MVVM
    5-1. MVVM의 개념 (vs MVC 패턴)
    5-2. MVVM 실습
      - [프로젝트16] AppleFramework_Combine-MVVM
      - [프로젝트17] GithubUserProfile-MVVM
      - [프로젝트18] GithubUserSearch-MVVM
    5-3. 디자인 패턴 (feat. Clean Architecture)
      - MVVM 이외 디자인 패턴


###  6. Project
    6-1. TossBenefitTab (토스 혜택앱)
      - [프로젝트19-1] TossBenefitTab (Combine, NetworkService 생생, MVVM 패턴 구조 완성)
      - [프로젝트19-2] TossBenefitTab (포인트 별 Detail View 생성 및 Navigation 연결, AutoLayout 설정)
    6-2. CarrotHomeTab (당근마켓 클론앱)
      - [프로젝트20-1] CarrotHomeTab (Combine, NetworkService 생생, Custom UITabBarItem 활용, NavigationBar 만들기)
      - [프로젝트20-2] CarrotHomeTab (AutoLayout 설정, UIScrollView 활용, 프로젝트 완성)
    6-3. UpDownGame (숫자 맞추기)
      - [프로젝트21] UpDownGame (UISlider를 활용한 랜덤 숫자맞추기)


###  7. AutoLayout (by Yagom)
    7-1. 작성중      
      
continue...
