//
//  MainViewController.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/26.
//

/*
 [V] Slider의 현재 위치값 확인, Slider 중앙 상단의 Label값 변동시키기
 [V] 체크(V) 버튼을 통해 랜덤값(1~6까지) 생성 및 현재 Slider와의 일치여부 확인
 [V] 총 횟수가 5번 이므로, 한번 진행할 때 마다 1씩 증가할 수 있도록 함
 [V] Reset은?
 */

import UIKit

class MainViewController: UIViewController {
    
    // randomGameSetting Struct
    var settingRandomGame = SettingRandomGame.settingRandomGame
    
    // RandomNumber
    var randomNumber: Int = 0
    
//    // RandomNumber Array
//    var randomArr: Array<Int> = []
    
    // RandonNumber Count
    var randomNumberCount: Int = 0
    
    // 상단 - Button 및 Title
    @IBOutlet weak var gameInfoTappedButton: UIButton!
    @IBOutlet weak var gameResetTappedButton: UIButton!
    
    // 중앙 - Slider 및 SliderValue, 최소 및 최대값 (변동)
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var minimumValue: UILabel!
    @IBOutlet weak var maximumValue: UILabel!
    
    // 중앙 - Hit Button
    @IBOutlet weak var hitButton: UIButton!
    
    // 하단 - Game 횟수
    @IBOutlet weak var tryCountLabel: UILabel!
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    // MARK: - ChangeView Button (GameInfoView)
    @IBAction func ChangeViewButtonDidTapped(_ sender: Any) {
        
        let gameInfoStoryboard = UIStoryboard(name: "GameInfo", bundle: nil)
        let vc = gameInfoStoryboard.instantiateViewController(identifier: "GameInfoViewController") as! GameInfoViewController
        
        // Navigation
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Slider Change Value (changeValue action)
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        print(">>> 현재 사용자 선택값 : \(value)")
        sliderValueLabel.text = String(value)
    }
    
    // MARK: - Touch Hit Button
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        
        // 조건1. RandomNumber와 사용자가 선택한 숫자가 일치할 경우와 5번 횟수를 모두 넘긴 경우
        if randomNumber == Int(sliderValueLabel.text ?? "") || tryCountLabel.text == "5" {
            print("Correct or Over Count!")
            reset()
            
        } else {
            // 조건2. RandomNumber와 사용자가 선택한 숫자가 일치하지 않을 경우
            
            // 조건3. RandomNumber가 사용자가 선택한 숫자보다 낮을경우 -> slider.maximum은 사용자가 선택한 숫자가 되며
            // RandomNumber가 사용자가 선택한 숫자보다 높을 경우 -> slider.minimum은 사용자가 선택한 숫자가 됨
            
            if randomNumber < Int(sliderValueLabel.text ?? "") ?? 0 {
                settingRandomGame.setSlider(slider: slider,
                                            value: .center,
                                            minimumValue: slider.minimumValue,
                                            maximumValue: slider.value)
                
                self.minimumValue.text = String(Int(slider.minimumValue))
                self.maximumValue.text = sliderValueLabel.text
                self.sliderValueLabel.text = String(Int(slider.value))
                
                randomNumberCount += 1
                print("현재 랜덤게임의 횟수는 : \(randomNumberCount)")
                
                // 게임 숫자 증가 + 1
                tryCountLabel.text = String((Int(tryCountLabel.text ?? "1") ?? 1) + 1)
            } else if randomNumber > Int(sliderValueLabel.text ?? "") ?? 0 {
                settingRandomGame.setSlider(slider: slider,
                                            value: .center,
                                            minimumValue: slider.value,
                                            maximumValue: slider.maximumValue)
                
                self.minimumValue.text = sliderValueLabel.text
                self.maximumValue.text = String(Int(slider.maximumValue))
                self.sliderValueLabel.text = String(Int(slider.value))
            
                randomNumberCount += 1
                print("현재 랜덤게임의 횟수는 : \(randomNumberCount)")
                
                // 게임 숫자 증가 + 1
                tryCountLabel.text = String((Int(tryCountLabel.text ?? "1") ?? 1) + 1)
            }
        }
    }
    
    // MARK: - Game Reset Button
    @IBAction func gameReset(_ sender: UIButton) {
        reset()
    }
    
    // Game Reset function
    private func reset() {
        // 배열 초기화
        self.randomNumberCount = 0
        
        // Slider 세팅
        settingRandomGame.setSlider(slider: slider, value: .center, minimumValue: 0.0, maximumValue: 30.0)
        self.sliderValueLabel.text = String(Int(slider.value))
        self.minimumValue.text = String(Int(slider.minimumValue))
        self.maximumValue.text = String(Int(slider.maximumValue))
        
        // 랜덤숫자 생성
        createRandomNumber()
        
        // 게임횟수 초기화
        tryCountLabel.text = String(randomNumberCount + 1)
        
        // 로그 확인
        print("랜덤숫자 : \(randomNumber)")
    }
    
    // created RandomNumber
    private func createRandomNumber() {
        settingRandomGame.createRandomNumber(slider.minimumValue,
                                             slider.maximumValue,
                                             randomNum: &randomNumber)
    }
}
