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
    var sc: [String: Int] = [:]
    
    // Credit Average -> 평점만 나타내는 함수? -> 연산
    // name, sc 매개변수로 받아서,
    // 해당 name에 해당하는 
//    func
    
    // Count check
    func checkTheStudents(student: [Student]) {
        print("학생 수 : \(student.count)")
    }
}


enum Credit: Double {
    case ap = 4.5,
         a = 4.0,
         bp = 3.5,
         b = 3.0,
         cp = 2.5,
         c = 2.0,
         dp = 1.5,
         d = 1.0,
         f = 0.0
    
    init?(credit: String) {
        switch credit {
        case "A+" :
            self = .ap
        case "A" :
            self = .a
        case "B+" :
            self = .bp
        case "B" :
            self = .b
        case "C+" :
            self = .cp
        case "C" :
            self = .c
        case "D+" :
            self = .dp
        case "D" :
            self = .d
        case "F" :
            self = .f
        default :
            return nil
        }
    }
}
