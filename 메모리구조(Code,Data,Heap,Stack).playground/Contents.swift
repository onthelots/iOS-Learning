import UIKit

// MARK: - 메모리 구조
// 메모리란, 즉 컴퓨터에서 RAM이라고 불리는 하드웨어에 저장되는 영역이자 공간
// 단일한 영역이 아닌, 크게 4가지 영역(Code, Data, Heap, Stack)으로 구분됨

// MARK: - Code
// 개발자가 작성하는 명령문(조건문, 반복문 외)이 저장되는 영역
// 다시 말해, 개발자의 코드(고수준) -> 컴퓨터가 이해할 수 있는 언어(저수준)로 저장
// Swift의 경우, 컴파일 시점에서 할당됨

// MARK: - Data
// 흔히 '전역변수'와 '정적변수'가 저장되는 영역임
// 전역(Global)변수란, 특정 컨텍스트 외부에 위치하고 있는 변수로, 어디서든 접근이 가능한 변수임

var nickname: String = "Lime"
var number: Int = 486

// 정적(Static)변수는, 구조체나 클래스 내부에 위치하고 있는 변수(프로퍼티)이며,
// Static이란 키워드를 활용해 외부에서 인스턴스를 생성하지 안더라도 접근할 수 있는 변수임
// 타입 프로퍼티로 생각해도 무방할 듯

struct fruits {
    static var apple: String = "사과"
}

fruits.apple // "사과"
