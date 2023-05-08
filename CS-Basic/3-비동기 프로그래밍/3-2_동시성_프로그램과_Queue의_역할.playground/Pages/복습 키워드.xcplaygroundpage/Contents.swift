//: [Previous](@previous)

import Foundation

/*
 👨🏻‍🦰CPU : Centeral Processing Unit, 컴퓨터의 '뇌' 역할을 담당하는 하드웨어. 일종의 '프로세서' (Josh / 사장)
 👩🏻‍💻Core: CPU의 물리적 계산을 담당하는 연산회로 유닛 (Kate / 직원)
 🖥️Thread(H/W) : Core가 할 수 있는 최소한의 일 단위 (Monitor, 하이퍼 스레딩 기술 도입에 따른 코어와 스레드의 관계는 1:N으로 발전)
 
 ⬇︎ 실제 컴퓨터가 작업하는 과정에서는?
 
 📱Program : 정적 형태로서, 컴퓨터에서 실행할 수 있는 파일 (.exe, .dmg)
 
 ⬇︎ 프로그램이 실행되면?
 
 ⚙️Process : 프로그램이 실행되는 과정. 프로세스가 진행되는 시점에서 독립적인 메모리(Memory / Data, Code, Stack, Heap)에 할당됨
    - 여기서 CPU는, 해당 Core와 Thread(H/W)의 프로세스 과정을 지원함
    - 해당 과정이 바로 'Context Switching'
    - 다수의 프로세스가 병렬적으로 진행되는 경우를 '멀티 프로세스'라고 하며, 이 때 CPU는 과도한 Context Switching으로 부담이 증가할 우려가 있음
 
 ⬇︎ 이를 해소하기 위해?
 
 〰️Thread(S/W) : 프로세스의 더 작은 단위이자, 일련의 '작업 흐름' (Thread). 동일한 프로세스 내에서 다수의 스레드릁 활용하여 작업을 진행함
    - 각각의 스레드는, 메모리 영역(Data, Code, Stack, Heap) 중 'Stack(함수를 호출할 경우, 지역변수나 매개변수, 리턴값 등이 저장되는 영역)' 영역만 독립적으로 사용합니다.
    - 장점 : Stack 영역을 제외한 나머지 영역은 [공유 영역]이 되므로, CPU의 부담이 감소하게 되며, 스레드 간 정보공유가 용이해집니다.
    - 단점 : 공유영역에서의 이슈가 발생할 경우, 모든 스레드가 영향을 받을 수도 있습니다(동기화 이슈)
 */

//: [Next](@next)
