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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ChangeViewButtonDidTapped(_ sender: Any) {
        
        let gameInfoStoryboard = UIStoryboard(name: "GameInfo", bundle: nil)
        let vc = gameInfoStoryboard.instantiateViewController(identifier: "GameInfoViewController") as! GameInfoViewController
//        navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true)
    
    }
}

