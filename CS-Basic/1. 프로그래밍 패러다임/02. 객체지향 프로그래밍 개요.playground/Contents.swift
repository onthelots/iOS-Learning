import UIKit

// MARK: - 객체지향 프로그래밍

// Class의 생성
// 예시) Guitar

class Guitar {
    
    // 3개의 프로퍼티(속성)
    var bodyColor: String
    var bodyShape: String
    var soundHole: Bool
    
    // 인스턴스(클래스의 객체)를 생성하기 위해, 프로퍼티의 초기값을 설정
    init(bodyColor: String, bodyShape: String, soundHole: Bool) {
        self.bodyColor = bodyColor
        self.bodyShape = bodyShape
        self.soundHole = soundHole
    }
    
    // 메서드 1
    func playGuitar () {}
    
    // 메서드 2
    func connectToAmp () {}
}


let acoustic: Guitar = Guitar(bodyColor: "Maple", bodyShape: "D-Body", soundHole: true)

acoustic.playGuitar()
acoustic.connectToAmp()

let electric: Guitar = Guitar(bodyColor: "Pink", bodyShape: "Super-Strat", soundHole: false)

electric.playGuitar()
electric.connectToAmp()


// 만약, class 내부에서 메서드에 대한 조건을 추가한다면?
// 예를 들면, acoustic은 Amp에 연결할 수 없도록 선언을 하고 싶다면 말이지..

// 아래와 같은 기존 프로퍼티나 별도의 Flag 변수를 만들어서 조건을 설정할 수 있음
//if soundHole == true {
//    print("엠프에 연결할 수 없습니다")
//} else {
//    print("엠프에 연결되었습니다.")
//}




// MARK: - 객체지향 프로그래밍의 4가지 특징
// 추상화, 캡슐화(은닉화), 상속성, 다형성
