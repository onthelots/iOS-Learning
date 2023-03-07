//
//  NumberGEnerator.swift
//  (10.20) SwiftUI_Random quiz
//
//  Created by Jae hyuk Yim on 2022/10/20.
//

import Foundation


struct NumberGenerator {
    // 범위는 1~99
    // 초기값은 0으로 설정
    
    var number: Int = 0
    //    var state: NumberGeneratiorStateEnum
    
    // 랜덤한 숫자를 number에 집어넣어 주는 코드
    mutating func selectRandomNum(numberRange:Range<Int>) {
        self.number = Int.random(in: numberRange)
    }
}
