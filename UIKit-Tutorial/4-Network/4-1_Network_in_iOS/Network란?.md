# Network 이해하기

## 🔍 Concurrency
- 네트워크를 이해하기 전, '동시성(concurrency)'에 대해 이해할 필요가 있음
    - Concurrency란, 여러개의 작업이 동시에 일어나는 것 처럼 보이게 하는 방식임
    - 즉, 동시성을 통해 특정 작업이 '순서에 상관없이 동시에 수행'될 수 있음

- 예를 들면 Youtube를 보면서 밥을 먹는 경우
    - 눈으로 Youtube를 보면서 동시에 밥을 먹게 되는데
    - 얼핏 보면 동시에 두 작업을 하는 것으로 보이지만, 사실은 각각의 작업은 임의의 순서가 조합되어 있음
    - 마치 여러개의 작업이 함께 이뤄지는 것 처럼 보이는 것,'동시성'의 특성이라고 볼 수 있음


## 📊 Thread
- 작업은, 모두 Thread(스레드)에서 실행이 됨
    - ❶ Main-Thread : 화면표시, 그리고 사용자의 인터렉션을 받는 작업을 수행함
        - 데이터를 화면에 그려주는 일을 담당하며, 버튼 클릭 이벤트 등을 감지하는 것을 담당함 (중요)
    - ❷ Backgroud : Main-Thread 이외의 작업을 담당
        - 네트워크 혹은 특정 DB에서 데이터를 읽어오는 과정을 수행
    - ❸ Custom : 사용자가 직접 지정한 스레드


## ⛓️ Async vs Sync 
- Async(비동기) : 요청과 리턴이 동시에 이뤄지지 않음 (실제 사용은 비동기화로 진행됨)
    - Task🟢 ➟➟ Task🟣  ➟➟ Task⚪️
        Task🔵 ➟➟➟➟➟➟➟➟➟ Task🔴
- Sync(동기) : 요청과 리턴이 동시에 이뤄짐 (순차적으로 이뤄짐)
    - Task🟢 ➟ Task🔵 ➟ Task🟣 
    
- Network를 사용할 경우
    - Main-Thread에서 사용자 인터렉션(요청)이 있을 경우, HTTP Request를 실시하며
    - 이후 Network에서는 처리 후에 다시 Main-Thread로 Response를 보냄


## 🌐 HTTP
- 서버와 대화하는 방식이자, 일종의 '통신 규약'
- 데이터 요청은, 'URL' 방식을 통해 서버에 데이터를 요청하기 위한 주소값으로 구성됨
    - http // protocol
    - ://www.domain.com // host
    - :1234 // port
    - /path/to/resource // resource path
    - ?a=b&x=y // query
    
- 요청 메서드
    - GET : 요청
    - POST : 생성
    - PUT : 변경
    - DELETE : 삭제
    
### 데이터 응답
    - status code
        - 2xx : 성공
        - 3xx : 리 다이렉션 메세지
        - 4xx : 클라이언트 에러
        - 5xx : 서버 에러
    - body (요청한 데이터)
        - JSON
        - Image

### Network 방식
    - 요청(GET)시, URL + Request Method 가 필요함
    - 응답시, Status Code + Response Body (JSON) 으로 처리!
    - 이와 같은 방식을 활용하기 위해, iOS에서 활용하는 방식이 바로 URLSession!
