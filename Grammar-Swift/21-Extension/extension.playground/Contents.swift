import UIKit

// MARK: - Extension(확장)이란?
// 클래스, 구조체, 열거형, 프로토콜 등의 타입에 새로운 '기능'을 추가하는 것을 의미함
// extension의 경우, 이미 Swift에서 명명된 타입(원본 타입)으로 접근하여 기능(프로퍼티, 메서드, 초기값 등)을 확장시킬 수 있음

//extension 확장할 타입의 이름 {
// // 확장하고자 하는 기능 구현 (프로퍼티, 메서드, 초기값)
//}

// Swift 표준 라이브러리 타입(원시 데이터 타입)의 기능 대부분은 익스텐션으로 구현되어 있음
// Int, String, Double ..


// MARK: - 클래스의 상속(inheritance)과 Extension의 차이


// MARK: - Extension 선언하기
// extension 뒤에 해당 타입의 이름을 작성한 후, 내부 코드에 추가 기능을 선언함

// MARK: - 1. 기능추가 (메서드)
// 예시 -> CGSize란 구조체에 print 함수를 확장(Extension)하기
let view: CGSize = CGSize(width: 30, height: 50) // CGSize란 타입을 채택, 너비와 높이의 초기값을 설정해 줌

// 근데, width: 30, height: 50 과 같이 깔끔하게 출력하고자 한다면,
// 아래와 같이 어렵게 작성해줘야 함
print("width: \(view.width), height: \(view.height)") // width: 30.0, height: 50.0

// 그런데, 위에서 언급한 대로 extension은 기존의 타입에서 새로운 '기능'을 추가하는 역할을 한다고 살펴보았음
// 즉, 'CGSize'란 이미 명명된 구조체 내부에 깔끔하게 출력할 수 있는 print 메서드를 추가하면 되지 않을까?

extension CGSize {
    func printCGSize() {
        print("width: \(width), height: \(height)")
    }
}

view.printCGSize() // width: 30.0, height: 50.0


// MARK: - 2. 기능추가 (프로퍼티)
// Extension의 경우, '저장 프로퍼티'는 추가할 수가 없음 (연산 프로퍼티만 가능)
// 아래는 명명된 Double 구조체의 내부에 VAT(부가세)를 더하는 연산 프로퍼티을 추가(확장)하는 코드임
extension Double {
    var plusVAT: Double {
        return (self + Double(self * 0.1))
    }
}

// 변수 'bill'은 100.0이란 초기값을 가지고 있으며
let bill: Double = 100.0

// 위 extension을 통해 추가된 연산 프로퍼티 plusVAT를 불러온다면?
print(bill.plusVAT) // 110.0
