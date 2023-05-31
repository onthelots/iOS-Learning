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
    
    // Slider Value Changed
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    // MARK: - Touch Hit Button
    @IBAction func hitButtonTapped(_ sender: UIButton) {
        print(customSlider.value)
        let hitValue: Int = Int(customSlider.value) // hitButtton -> Slider(Float)를 Int로 변환
        
        customSlider.value = Float(hitValue) // slider의 값(Float)에 hitButton(Float)을 할당
        
        randomNumberCount += 1
        gameCountLabel.text = "\(randomNumberCount + 1)"
        
        // Hit!
        if randomNumber == hitValue {
            showAlert(message: "You Hit")
            reset()
            // Lose...
        } else if randomNumberCount >= 5 {
            showAlert(message: "You Lose")
            reset()
        } else if randomNumber < hitValue {
            settingUpDownGame.setSlider(slider: customSlider,
                                        value: .center,
                                        minimumValue: customSlider.minimumValue,
                                        maximumValue: customSlider.value)
            
            self.minimumValueLabel.text = String(Int(customSlider.minimumValue))
            self.maximumValueLabel.text = sliderValueLabel.text
            self.sliderValueLabel.text = String(Int(customSlider.value))
            
        } else {
            // randomNumber가 사용자 선택값(hitValue)보다 높을 경우 -> minimumValue를 사용자 선택값으로 설정
            settingUpDownGame.setSlider(slider: customSlider,
                                        value: .center,
                                        minimumValue: customSlider.value,
                                        maximumValue: customSlider.maximumValue)
            
            self.minimumValueLabel.text = sliderValueLabel.text
            self.maximumValueLabel.text = String(Int(customSlider.maximumValue))
            self.sliderValueLabel.text = String(Int(customSlider.value))
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
        
        // 게임횟수 초기화
        gameCountLabel.text = "1"
        
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
    
    // MARK: - Alert
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "다시하기",
                                     style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    // InfoView Tapped
    @IBAction func InfoViewTapped(_ sender: Any) {
        
        let gameInfoStoryboard = UIStoryboard(name: "GameInfo", bundle: nil)
        let vc = gameInfoStoryboard.instantiateViewController(identifier: "GameInfoViewController") as! GameInfoViewController
        
        // Navigation
        navigationController?.pushViewController(vc, animated: true)
    }
}
