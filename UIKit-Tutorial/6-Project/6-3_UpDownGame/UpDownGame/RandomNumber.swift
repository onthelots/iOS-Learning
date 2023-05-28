//
//  RandomNumber.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/27.
//

import Foundation
import UIKit

struct RandomNumberGameSetting {
    
    var seletedRandomNumber: Int = 0
    
    mutating func randomNumber(_ min: Int, _ max: Int) {
        
        var randomNumberArr: Array<Int> = []
        
        for i in min...max {
            randomNumberArr.append(i)
        }
        seletedRandomNumber = randomNumberArr.randomElement() ?? 0
        
        print("seletedNumber : \(seletedRandomNumber)")
    }
    
    // Slider Setting
    func setSlider(_ slider: UISlider, value: Float, minimumValue: Float, maximumVAlue: Float) {
        slider.value = value
        print(slider.value)
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumVAlue
    }
}
