//: [Previous](@previous)

import Foundation

// 3️⃣ 큐(Queue)란?

// - 개념
/*
 동시성 작업을 위해 필요한 스레드(S/W)의 생성과 스케쥴링 관리를 담당하는 일종의 '대기열'
 - 사전적인 용어로는 '티켓 등 표 따위를 구매하기 위해 줄을 서는 것' 이라고 하며, 작업을 수행하기 위해 대기하는 공간으로도 이해할 수 있음
 - 스레드에 업무(Task)를 배치하기 위해 선입 선출(FIFO:First In First Out)로서 동작
 */

// - DispatchQueue?
/*
 수행하고자 하는 작업을 Queue에 보내는 방식이 바로 DispatchQueue
 - 사전적 용어로는, '보내다' 혹은 '파견하다'
 */


// 메인 큐 -  async(비동기)
DispatchQueue.main.async {
    // 하나의 메인 스레드에서 작업하도록 하는 Serial(직렬) 방식의 큐
}

// 글로벌 큐 - async(비동기)
DispatchQueue.global().async {
    // 다수의 스레드에서 나눠 처리하는, Concurrent(병렬) 방식의 큐
}

//: [Next](@next)
