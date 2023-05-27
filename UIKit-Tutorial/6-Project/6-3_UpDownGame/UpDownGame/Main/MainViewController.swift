//
//  MainViewController.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/26.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var gameInfoTappedButton: UIButton!
    @IBOutlet weak var gameResetTappedButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        slider.value = 3.0
        slider.minimumValue = 1
        slider.maximumValue = 6
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ChangeViewButtonDidTapped(_ sender: Any) {
        
        let gameInfoStoryboard = UIStoryboard(name: "GameInfo", bundle: nil)
        let vc = gameInfoStoryboard.instantiateViewController(identifier: "GameInfoViewController") as! GameInfoViewController
        
        // Navigation
        navigationController?.pushViewController(vc, animated: true)
        
        // Modality
        present(vc, animated: true)
    }
}
