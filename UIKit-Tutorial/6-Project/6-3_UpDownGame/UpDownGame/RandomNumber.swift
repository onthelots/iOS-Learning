//
//  RandomNumber.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/27.
//

import Foundation


func randomNumber(_ min: Int, _ max: Int) -> Int {
    
    var emptyArr: Array<Int> = []
    
    for i in min...max {
        emptyArr.append(i)
    }
    
    return emptyArr.randomElement() ?? 0
}

