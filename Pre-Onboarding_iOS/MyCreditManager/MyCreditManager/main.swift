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
    case "4" :
        deleteCredit()
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
    
    // inputArr
    guard let inputArr = input?.components(separatedBy: " ") else {
        return
    }
    
    // name, credit
    guard let name = inputArr.first, let credit = inputArr.last else {
        return
    }
    
    
    if inputArr.count == 3, // 갯수
       (students.contains(where: {$0.name == name})), // 학생이 존재할 경우
       !inputArr.isEmpty, // 입력값이 비어있지 않은 경우
       creditValue.contains(where: {$0.key == credit}) { // 입력된 평점이 creditValue의 key값과 일치하는 경우
        
        let subject = inputArr[1] // subject
        let sc = [subject:credit] // sc(dictionary 생성)
        students.append(Student(name: name, sc: sc)) // 배열 내부값에 할당
        
        print("\(name) 학생의 \(subject) 과목이 \(credit)로 추가(변경)되었습니다.")
        print(inputArr)
    } else {
        print(errorMessage)
    }
    startCreditManager()
}

// MARK: - 성적 삭제
func deleteCredit() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift")
    
    // [ ] 이름 일치여부, 과목(key)값을 활용한 데이터 삭제
    let input = readLine()
    
    guard let inputArr = input?.components(separatedBy: "") else {
        return
    }
    
    guard let name = inputArr.first, let subject = inputArr.last else {
        return
    }
    
    if students.contains(where: {$0.name == name}),
       inputArr.count == 2,
       !inputArr.isEmpty {
        
        if let index = students.firstIndex(where: {$0.sc.keys == subject}) {
            students.remove(at: index)
        }
    } else {
        print(errorMessage)
        print(inputArr)
    }
    startCreditManager()
}
