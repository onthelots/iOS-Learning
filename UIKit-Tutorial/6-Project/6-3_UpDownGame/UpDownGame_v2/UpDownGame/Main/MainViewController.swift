//
//  MainViewController.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/26.
//

import UIKit

class MainViewController: UIViewController {
    
    // randomGameSetting Singleton
    var settingUpDownGame = SettingUpDownGame.settingUpDownGame
    
    // RandomNumber
    var randomNumber = 0
    
    // RandonNumber Count
    var randomNumberCount: Int = 0
    
    // MARK: - IBOutlets
    
    // 상단 - Button 및 Title
    @IBOutlet weak var gameInfoButton: UIButton!
    @IBOutlet weak var gameResetButton: UIButton!
    
    // 중앙 - Slider 및 SliderValue, 최소 및 최대값 (변동)
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var customSlider: UISlider!
    
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    // 중앙 - Hit Button
    @IBOutlet weak var hitButton: UIButton!
    
    // 하단 - Game 횟수
    @IBOutlet weak var gameCountLabel: UILabel!
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    // MARK: - IBActions
    
    // InfoView Tapped
    @IBAction func InfoViewTapped(_ sender: Any) {
        
        let gameInfoStoryboard = UIStoryboard(name: "GameInfo", bundle: nil)
        let vc = gameInfoStoryboard.instantiateViewController(identifier: "GameInfoViewController") as! GameInfoViewController
        
        // Navigation
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Slider Value Changed
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        print(">>> 현재 사용자 선택값 : \(value)")
        sliderValueLabel.text = String(value)
    }
    
    // MARK: - Touch Hit Button
    @IBAction func hitButtonTapped(_ sender: UIButton) {
        
        // 조건1. RandomNumber와 사용자가 선택한 숫자가 일치할 경우와 5번 횟수를 모두 넘긴 경우
        if randomNumber == Int(sliderValueLabel.text ?? "") || gameCountLabel.text == "5" {
            print("Correct or Over Count!")
            reset()
        } else {
            // 조건2. RandomNumber와 사용자가 선택한 숫자가 일치하지 않을 경우
            
            // 조건2-1. RandomNumber가 사용자가 선택한 숫자보다 낮을경우 -> slider.maximum은 사용자가 선택한 숫자가 됨
            if randomNumber < Int(sliderValueLabel.text ?? "") ?? 0 {
                settingUpDownGame.setSlider(slider: customSlider,
                                            value: .center,
                                            minimumValue: customSlider.minimumValue,
                                            maximumValue: customSlider.value)
                
                self.minimumValueLabel.text = String(Int(customSlider.minimumValue))
                self.maximumValueLabel.text = sliderValueLabel.text
                self.sliderValueLabel.text = String(Int(customSlider.value))
                
                randomNumberCount += 1
                print("현재 랜덤게임의 횟수는 : \(randomNumberCount)")
                
                // 게임 숫자 증가 + 1
                gameCountLabel.text = String((Int(gameCountLabel.text ?? "1") ?? 1) + 1)
                
                // 조건2-2. RandomNumber가 사용자가 선택한 숫자보다 높을 경우 -> slider.minimum은 사용자가 선택한 숫자가 됨
            } else if randomNumber > Int(sliderValueLabel.text ?? "") ?? 0 {
                settingUpDownGame.setSlider(slider: customSlider,
                                            value: .center,
                                            minimumValue: customSlider.value,
                                            maximumValue: customSlider.maximumValue)
                
                self.minimumValueLabel.text = sliderValueLabel.text
                self.maximumValueLabel.text = String(Int(customSlider.maximumValue))
                self.sliderValueLabel.text = String(Int(customSlider.value))
            
                randomNumberCount += 1
                print("현재 랜덤게임의 횟수는 : \(randomNumberCount)")
                
                // 게임 숫자 증가 + 1
                gameCountLabel.text = String((Int(gameCountLabel.text ?? "1") ?? 1) + 1)
            }
        }
    }
    
    // MARK: - Game Reset Button
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }
    
    // Game Reset function
    private func reset() {
        
        // 랜덤숫자 횟수 초기화
        self.randomNumberCount = 0
        
        // 랜덤숫자 생성
        randomNumber = Int.random(in: 0...30)
        
        // Slider 재 세팅
        settingUpDownGame.setSlider(slider: customSlider, value: .center, minimumValue: 0.0, maximumValue: 30.0)
        self.sliderValueLabel.text = String(Int(customSlider.value))
        self.minimumValueLabel.text = String(Int(customSlider.minimumValue))
        self.maximumValueLabel.text = String(Int(customSlider.maximumValue))
        
        // 랜덤숫자 생성
        randomNumber = Int.random(in: 0...30)
        
        // 게임횟수 초기화
        gameCountLabel.text = String(randomNumberCount + 1)
        
        // 로그 확인
        print("랜덤숫자 : \(randomNumber)")
    }
}
