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
        deleteStudent()
    case "3" :
        addCredit()
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
        print("\(input ?? "") 학생을 삭제하였습니다.")
    } else {
        print(errorMessage)
    }
    startCreditManager()
}

// MARK: - 성적추가
func addCredit() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    let input = readLine()
    
    // 이름 V 과목 V 평점(String)
    // 조건1. input이 비어있지 않아야 하며, ""(split) 문자열로 3개 이상 변환할 시, 3개의 문자열이 배열에 포함되어야 함
    // 조건2. 해당 학생의 이름이 반드시 존재해야 함
    // 조건3. 작성된 평점 또한 Credit에 포함되어야 함
    guard let inputArr = input?.components(separatedBy: " ") else {
        return
    }
    
    let name = inputArr.first // 이름
    let subject = inputArr[1] // 과목
    let credit = inputArr.last // 점수
    
    let sc = [subject:credit]
 
    if inputArr.count == 3, (students.contains(where: {$0.name == name})) {
        students.append(Student(name: name ?? "", sc: sc))
        print("\(name) 학생의 \(subject) 과목이 \(credit)로 추가(변경)되었습니다.")
    } else {
        print(errorMessage)
    }
    startCreditManager()
}
