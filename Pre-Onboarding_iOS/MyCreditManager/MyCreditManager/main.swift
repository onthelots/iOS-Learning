//
//  main.swift
//  MyCreditManager
//
//  Created by Jae hyuk Yim on 2023/04/23.
//

import Foundation

/*
 [ ] 학생 -> 추가, 삭제
 */

// student 타입의 빈 배열 생성
var students: [Student] = []

// 1번과 2번이 선택될 경우와 그렇지 않은 경우(잘못 입력되는 상황)

func creditManagerStarted() {
    print(defaultMessage)
    let input = readLine()
    
    switch input {
    case "1" :
        print("추가할 학생의 이름을 입력해주세요")
    case "2" :
        print("삭제할 학생의 이름을 입력해주세요")
    case "X" :
        print("프로그램을 종료합니다...")
        break
    default :
        print(errorMessage)
        creditManagerStarted()
    }
}

creditManagerStarted()


