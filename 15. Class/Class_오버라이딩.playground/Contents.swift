import UIKit

// MARK: - 오버라이딩(Overriding)
// 상위 클래스의 기능을 '수정'을 통해 새로운 버전의 메서드를 만드는 방법

// 예시
class Animals {
    var name: String?
    var age: Int?
    
    func sound(name: String) -> String {
        return ("\(name)은 컹컹컹 하고 소리를 냅니다.")
    }
}

// MARK: - 1. 완전히 새로운 형태의 메서드를 생성
//class Cow: Animals {
//    var nickname: String? // 새로운 프로퍼티(속성) 생성
//
//    // signitureSound라는 메서드를 새롭게 생성
//    func signitureSound(repeatTime: Int) -> String {
//        return ("\(repeatTime)시간마다 음메 하고 소리를 냅니다.")
//    }
//}


// MARK: - 2. 오버라이딩을 통한 메서드 변경
class Cow: Animals {
    var nickname: String?

    // 이렇게, 상위클래스의 메서드를 그대로 상속받기 위해선
    // 앞에 'override'란 키워드가 붙어야 함
    override func sound(name: String) -> String {
        
        super.sound(name: name)
        return ("\(name)은 음메 하고 소리를 냅니다.")
    }
}

var myCow: Cow = .init()

myCow.sound(name: "워낭이")


