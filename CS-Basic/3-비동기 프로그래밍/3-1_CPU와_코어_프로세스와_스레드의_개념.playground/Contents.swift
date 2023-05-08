import UIKit

//sync
//sleep(3)
//print("출력해줘")


// async
//DispatchQueue.main.async {
//    sleep(3)
//    print("두번째 출력")
//}
//
//print("첫번째 출력")



// MARK: - 메인(main)큐에서의 큐 작업 분산 작업 (serial)
// task 1
//print("start")
//
//// task 4
//DispatchQueue.main.async {
//    for _ in 0...10 {
//        print("비동기 async")
//    }
//}
//
//// task 2
//for _ in 0...10 {
//    print("동기 sync")
//}
//
//// task 3
//print("end")


// MARK: - 글로벌(global)큐에서의 큐 작업 분산 작업 (concurrent)

//print("start")
//
//DispatchQueue.global().async {
//    for _ in 0...10 {
//        print("글로벌 큐 --> 비동기 async")
//    }
//}
//
//for _ in 0...10 {
//    print("동기 sync")
//}
//
//print("end")


// MARK: - Deadlock -> 작업을 더이상 진행할 수 없는 경우
// 만약, main 큐(큐가 하나의 스레드에 작업을 던지는 경우)에
// sync작업(스레드에서 작업이 마무리될 때 까지 기다리는 경우)을 진행한다고 가정해보자

// 여기서 Deadlock이 발생하는 이유는 아래와 같다.
// 현재 작성하는 모든 코드는 
// 1. main큐는 1작업:1스레드 방식이다.
// 2. sync 작업은 스레드가 마무리 될 때까지 기다렸다가,
