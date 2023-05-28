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
    var randomGameSetting: SettingRandomGame = SettingRandomGame()
    
    // RandomNumber Array
    var randomNumberArrToCountGame: Array<Int> = []
    
    // 상단 - Button 및 Title
    @IBOutlet weak var gameInfoTappedButton: UIButton!
    @IBOutlet weak var gameResetTappedButton: UIButton!
    
    // 중앙 - Slider 및 Label, Check UIImage
    @IBOutlet weak var selectedNumber: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var hitButton: UIButton!
    
    // 하단 - Game 횟수
    @IBOutlet weak var numOfGame: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // game Reset
        reset()
        
        // seletedNumber init
        selectedNumber.text = "0"
        
        // numOfgame init
        numOfGame.text = "1"
        
        // slider 기본세팅
        randomGameSetting.setSlider(slider, value: 0.0, minimumValue: 0.0, maximumValue: 6.0)
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
        print("현재 위치값 : \(value)")
        
        selectedNumber.text = String(value)
        print(">> 선택한 값 : \(selectedNumber.text ?? "")")
    }
    
    // MARK: - Touch Hit Button
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        
        // 랜덤 넘버 생성
        randomGameSetting.createRandomNumber(0, 6)
        
        // randomNumber Count 배열에 할당
        randomNumberArrToCountGame.append(randomGameSetting.randomNumber)
        
        print("RandomNumber 배열은? : \(randomNumberArrToCountGame)")
        
        // 게임 숫자 증가 + 1
        numOfGame.text = String((Int(numOfGame.text ?? "1") ?? 1) + 1)
        
        // 5번 진행했을 경우
        if randomNumberArrToCountGame.count == 5 {
            randomNumberArrToCountGame = [] // 배열 초기화
            numOfGame.text = "1" // 게임 횟수 초기화
        }
        
        // 값 비교 vs
        guard let seletedNumber = selectedNumber.text else {
            return
        }
        
        if randomNumberArrToCountGame.last == Int(seletedNumber) {
            print("Correct!")
            hitButton.tintColor = UIColor.blue
        } else {
            hitButton.tintColor = UIColor.red
            print("Failure!")
        }
    }
    
    // MARK: - Game Reset Button
    @IBAction func gameReset(_ sender: UIButton) {
        slider.value = 0.0
        reset()
    }
    
    private func reset() {
        print("reset!")
    }

}
