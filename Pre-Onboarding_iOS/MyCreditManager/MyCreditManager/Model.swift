//
//  Model.swift
//  MyCreditManager
//
//  Created by Jae hyuk Yim on 2023/04/25.
//

import Foundation

// Student Infomation
struct Student {
    // name
    var name: String = ""
    
    // subject & Credit
    var sc: [String: String] = [:]
    
    // Credit Average -> 평점만 나타내는 함수? -> 연산
    // name, sc 매개변수로 받아서,
    // 해당 name에 해당하는 
//    func
    
    // Count check
    func checkTheStudents(student: [Student]) {
        print("학생 수 : \(student.count)")
    }
}


let creditValue: [String: Float] = [
    "A+" : 4.5,
    "A"  : 4.0,
    "B+" : 3.5,
    "B"  : 3.0,
    "C+" : 2.5,
    "C"  : 2.0,
    "D+" : 1.5,
    "D"  : 1.0,
    "F"  : 0.0
]

