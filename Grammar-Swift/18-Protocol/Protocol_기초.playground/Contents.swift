import UIKit

// MARK: - 프로토콜이란?
// 특정 기능에 적합한 메서드, 프로퍼티 외 기타 요구사항에 대한 청사진을 의미하며
// 프로토콜에 정의된 요구사항을 바탕으로 기능 구현이 추진됨


// MARK: - 왜 필요한데?
// 클래스 혹은 구조체 등, 특정 '틀'이 구조적으로 올바르게 되기 위한 특정 규칙이 존재하지 않음
// 하지만, 특정 클래스와 함께 작업을 할 경우엔 반드시 특정 조건에 부합해야 함
// 예를 들면, 개발을 위한 Tool들의 모음인 'iOS SDK(Software Development Kit)' 내 다양한 프레임워크와 연계하여
// 동작하는 클래스, 구조체를 만들 경우엔 더 더욱 필요함.

// 정리하자면, '약속'인데,
// 소프트웨어 개발을 위한 최소한의 요구사항과 규칙을 준수하기 위해 프로토콜이란 청사진(BluePrint)이 필요함!


// MARK: - Protocol 찍먹하기
// 예시는 아래와 같음
// 개발자가 업무를 하는 'Workspace'에는 아래와 같은 요소들이 존재함
// Table, Computer, Chair, Sofa -> 프로퍼티
// work(), rest() -> 메서드


// MARK: - Protocol 선언(정의)하기

protocol Workspace {
    // 4개의 가구 및 용품(프로퍼티)
    var table: String { get set }
    var computer: String { get set }
    var chair: String { get set }
    var sofa: String { get set }
    
    // 행위(메서드)
    func work()
    func rest()
}

// MARK: - Protocol 채택하기

struct myWorkSpace: Workspace {
    
    var table: String = "이케아"
    var computer: String = "맥 미니"
    var chair: String = "시디즈"
    var sofa: String = "자코모"
    
    func work() {
        print("2시간 초과 근무중..")
    }
    
    func rest() {
        print("10분만 눈 감고 있을게..")
    }
}
