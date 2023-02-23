import UIKit


// Heap 코드 예시

class Aniamls {
    var name: String
    
    init(name: String) {
        self.name = name
        print("\(name)이 init 되었습니다.")
    }
    
    // 인스턴스가 메모리 상에서 제거(de-allocation)되었는지 확인하기 위해 deinit 메서드 활용
    
    deinit {
        print("\(name)이 deinit 되었습니다.")
    }
}

// 아래와 같이 인스턴스 2개를 생성함
var myDog: Aniamls?
var yourDog: Aniamls?

// 먼저, 첫번째 myDog 인스턴스에 초기값을 할당함
myDog = Aniamls(name: "Van") // "Van"이 init 되었습니다. (rc 1)
yourDog = myDog // (rc 2)

myDog = nil // (rc 1)
yourDog = nil // (rc 2) "Van이 deinit 되었습니다." -> 메모리 해제!
