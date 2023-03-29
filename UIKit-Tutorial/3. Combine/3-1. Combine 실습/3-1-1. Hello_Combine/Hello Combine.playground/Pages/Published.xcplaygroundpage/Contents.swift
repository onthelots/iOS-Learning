//: [Previous](@previous)

import Foundation
import UIKit
import Combine

// MARK: - Published
// @published 키워드를 활용한 특정 프로퍼티를 -> 퍼블리셔(생산자)로 만들어 줌
// 반드시! 클래스에서만 사용 가능하며, Scope 외부에서는 $를 이용하여 해당 퍼블리셔에 접근할 수 있음

// Model 클래스 (여기선 이름 name이 @published 키워드로 선언되어 있으므로, 퍼블리셔로서 외부에서도 접근할 수 있음)
final class SomeViewModel {
    @Published var name: String = "Lime"
    var age: Int = 20
}

// UILabel과 같이, 일종의 text를 나타내는 클래스를 선언
final class Label {
    var text: String = ""
}

// 각각의 클래스 인스턴스를 선언
let label = Label()
let viewModel = SomeViewModel()

print("현재의 text의 값은 : \(label.text)")
// ------ 현재의 text의 값은 :

// viewModel 내부에 선언된 퍼블리셔(생산자)를 $ 키워드를 활용해 가져오고
// 'assign'(키패스를 활용해 특정 데이터를 가져옴)메서드를 활용하여 label 클래스 인스턴스 내 text(프로퍼티)에게 구독할 수 있도록 함
// 정리하자면, @생산자(Published) name의 값을 -> label text는 구독하며, 값을 할당받게 됨
viewModel.$name.assign(to: \.text, on: label)

print("구독 후, text의 값은 : \(label.text)")
// ------  구독 후, text의 값은 : Lime

viewModel.name = "Kate"
print("구독 후, text의 값은 : \(label.text)")
// ------  구독 후, text의 값은 : Kate

//: [Next](@next)
