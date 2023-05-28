//
//  RandomNumber.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/27.
//

import Foundation
import UIKit

struct SettingRandomGame {
    
    // singleton
    static let settingRandomGame = SettingRandomGame()
    
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
    
    // 랜덤숫자 만들기
    func createRandomNumber(_ min: Float, _ max: Float, randomNum: inout Int) {
        
        var createToRandomNumArr: Array<Int> = []
        
        let min = Int(min)
        let max = Int(max)
        
        for i in min...max {
            createToRandomNumArr.append(i)
        }
        
        // randonNum 생성
        randomNum = createToRandomNumArr.randomElement() ?? 0
        print("랜덤 넘버 : \(randomNum)")
    }
    
    // SliderValueCoordinate
    enum SliderValueCoordinate: Float {
        case leftmost
        case center
        case rightmost
    }
}
