# 💡 Wanted Pre-Onboarding Challenge

#### 해당 README는 원티드 프리온보딩 iOS 챌린지(5월) 사전과제 내용입니다.
#### 사전 과제와 관련된 자세한 내용을 담고 있습니다.

## **MyCreditManager (성적관리 프로그램)**

### 사용 언어 / 환경
- Swift
- Xcode 기본 템플릿 중 [macOS - Command Line Tool]

### 프로그램의 메뉴
- 1.학생추가 / 2.학생삭제 / 3.성적추가(변경) / 4.성적삭제 / 5.평점보기 / 6.종료

### 프로그램 동작조건
- 사용자가 종료 메뉴를 선택하기 전까지는 계속해서 사용자의 입력을 받습니다
- 메뉴선택을 포함한 모든 입력은 숫자 또는 영문으로 받습니다

### 성적별 점수
- A+ (4.5점) / A (4점)
- B+ (3.5점) / B (3점)
- C+ (2.5점) / C (2점)
- D+ (1.5점) / D (1점)
- F (0점)

### 평점
- 각 과목의 점수 총 합 / 과목 수
- 최대 소수점 2번째 자리까지 출력

<br>

---

<br>

## **프로그램 동작모습**
`예시 화면의 굵은 글씨는 콘솔 출력 내용이며, 얇은 글씨는 콘솔을 통한 입력 내용입니다.`

### 메뉴의 잘못된 입력 처리
![image](https://user-images.githubusercontent.com/107039500/234001476-787d9997-0b18-4df8-8c35-df002edc26a5.png)

### **학생추가**

- 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다.
- 이미 존재하는 학생은 다시 추가하지 않습니다.

![image](https://user-images.githubusercontent.com/107039500/234001883-97fa9840-7b09-442a-8889-0425c7664d1b.png)


### **학생 삭제**

- 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다.
- 없는 학생은 삭제하지 않습니다.

![image](https://user-images.githubusercontent.com/107039500/234001948-8f66a04c-3946-445a-8631-df2af0f4f42d.png)


### **성적추가**

- 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다.
- 없는 학생의 성적은 추가하지 않습니다.

![image](https://user-images.githubusercontent.com/107039500/234002041-a1978e99-1825-4750-ba7f-e1d058a308dd.png)
![image](https://user-images.githubusercontent.com/107039500/234002061-528f6401-c549-4d02-b3a0-09c42f7fdc38.png)



### **성적삭제**

- 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다.
- 없는 학생의 성적은 삭제하지 않습니다.

![image](https://user-images.githubusercontent.com/107039500/234002105-9696c14d-4d39-446b-b5bc-cb4142136dfd.png)



### **평점보기**

- 메뉴를 선택한 후에도 잘못 입력한 것이 있으면 처리해 주어야합니다.
- 해당 학생의 과목과 성적을 모두 출력한 후 마지막 줄에 평점을 출력합니다.
- 없는 학생은 평점을 보여주지 않습니다.

![image](https://user-images.githubusercontent.com/107039500/234002138-750b50a6-cb77-47e9-84af-6705b26d15c5.png)


### **종료**

- 프로그램을 종료합니다.

![image](https://user-images.githubusercontent.com/107039500/234002185-ade021d4-ef50-452a-9c0b-e886048af27b.png)
