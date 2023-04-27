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
    
    // Count check
    func checkTheStudents(student: [Student]) {
        print("학생 수 : \(student.count)")
    }
    
    // Average
    // 평균값~
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

