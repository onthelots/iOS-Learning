//
//  MainViewController.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/26.
//

/*
 [ ] Slider의 현재 위치값 확인, Slider 중앙 상단의 Label값 변동시키기
 [ ] 체크(V) 버튼을 통해 랜덤값(1~6까지) 생성 및 현재 Slider와의 일치여부 확인
 [ ] 총 횟수가 5번 이므로, 한번 진행할 때 마다 1씩 증가할 수 있도록 함
 [ ] Reset은?
 */

import UIKit

class MainViewController: UIViewController {
    
    // 상단 - Button 및 Title
    @IBOutlet weak var gameInfoTappedButton: UIButton!
    @IBOutlet weak var gameResetTappedButton: UIButton!
    
    // 중앙 - Slider 및 Label, Check UIImage
    @IBOutlet weak var selectedNumber: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var checkImage: UIImageView!
    
    // 하단 - Game 횟수
    @IBOutlet weak var numOfGame: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSlider(slider, value: 3.0, minimumValue: 1.0, maximumVAlue: 6.0)
    }
    
    @IBAction func ChangeViewButtonDidTapped(_ sender: Any) {
        
        let gameInfoStoryboard = UIStoryboard(name: "GameInfo", bundle: nil)
        let vc = gameInfoStoryboard.instantiateViewController(identifier: "GameInfoViewController") as! GameInfoViewController
        
        // Navigation
        navigationController?.pushViewController(vc, animated: true)
        
        // Modality
        present(vc, animated: true)
    }
    
    private func setSlider(_ slider: UISlider, value: Float, minimumValue: Float, maximumVAlue: Float) {
        slider.value = value
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumVAlue
    }
}
