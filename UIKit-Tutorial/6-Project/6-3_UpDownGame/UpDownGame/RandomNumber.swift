//
//  RandomNumber.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/27.
//

import Foundation
import UIKit

struct SettingRandomGame {
    
    var randomNumber: Int = 0
    
    mutating func createRandomNumber(_ min: Int, _ max: Int) {
        
        var randomNumberArr: Array<Int> = []
        
        for i in min...max {
            randomNumberArr.append(i)
        }
        randomNumber = randomNumberArr.randomElement() ?? 0
        
        print("랜덤 넘버 : \(randomNumber)")
    }
    
    // Slider Setting
    func setSlider(_ slider: UISlider, value: Float, minimumValue: Float, maximumValue: Float) {
        slider.value = value
        print(slider.value)
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumValue
        
        // ThumbImage
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .normal)
    }
}
