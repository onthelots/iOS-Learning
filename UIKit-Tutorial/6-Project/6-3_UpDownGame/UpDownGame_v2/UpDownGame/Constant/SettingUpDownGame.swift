//
//  RandomNumber.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/27.
//

import Foundation
import UIKit

struct SettingUpDownGame {
    
    // singleton
    static let settingUpDownGame = SettingUpDownGame()
    
    // Slider Setting
    func setSlider(slider: UISlider, value: SliderValueCoordinate, minimumValue: Float, maximumValue: Float) {
        
        // Slider Default value
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumValue
        
        // SliderValue -> value의 값을 enum case에 따라 다르게 할당
        switch value {
        case .leftmost :
            slider.value = minimumValue
        case .center :
            slider.value = ((maximumValue + minimumValue) / 2)
        case .rightmost :
            slider.value = maximumValue
        }
        
        // ThumbImage
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .normal)
    }
    
    // SliderValueCoordinate
    enum SliderValueCoordinate: Float {
        case leftmost
        case center
        case rightmost
    }
}
