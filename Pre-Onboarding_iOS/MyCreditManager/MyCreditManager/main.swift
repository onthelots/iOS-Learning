//
//  main.swift
//  MyCreditManager
//
//  Created by Jae hyuk Yim on 2023/04/23.
//

import Foundation

// student 타입의 빈 배열 생성
var students: [Student] = []

// Model

var studentModel: Student = Student()

startCreditManager()

//  MARK: - 실행(main) 함수
func startCreditManager() {
    print(defaultMessage)
    let input = readLine()
    
    switch input {
    case "1" :
        addStudent()
    case "2" :
        print("삭제할 학생의 이름을 입력해주세요")
    case "X" :
        print("프로그램을 종료합니다...")
        break
    default :
        print(errorMessage)
        startCreditManager()
    }
}

// MARK: - 학생추가
func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    let input = readLine()
    
    if let input = input, !input.isEmpty {
        if students.contains(where: { $0.name == input }) {
            print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            students.append(.init(name: input))
            print("\(input)학생을 추가했습니다.")
            studentModel.checkTheStudents(student: students)
        }
    } else {
        print(errorMessage)
    }
    startCreditManager()
}


// MARK: - 학생삭제
func deleteStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    let input = readLine()
    
    // index -> 첫번째 인덱스부터(where 조건문을 통해 name -> 입력한 input 값)
    if let index = students.firstIndex(where: {$0.name == input}) {
        // remove(at:)을 통해 해당 값(인덱스) 삭제
        students.remove(at: index)
        print("\(input) 학생을 삭제하였습니다.")
    } else {
        print(errorMessage)
    }
    startCreditManager()
}

// MARK: - 성적추가
// 

func addCredit(name: String) {
    let input = readLine()
    
}
