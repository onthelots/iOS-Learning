import UIKit

// MARK: - Extension(확장)이란?
// 클래스, 구조체, 열거형 등의 타입에 새로운 '기능'을 추가하는 것을 의미함
// extension의 경우, 이미 Swift에서 명명된 타입(원본 타입)으로 접근하여 기능(프로퍼티, 메서드, 초기값 등)을 확장시킬 수 있음

// MARK: - Extension 선언하기
// extension 뒤에 해당 타입의 이름을 작성한 후, 내부 코드에 추가 기능을 선언함

// 예시 -> CGSize란 구조체에 print 함수를 확장(Extension)하기
let view: CGSize = CGSize(width: 30, height: 50)
print(view) // (30.0, 50.0)
