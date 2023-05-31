//
//  GameInfoViewController.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/26.
//

import UIKit

class GameInfoViewController: UIViewController {

    @IBOutlet weak var gameInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // gameInfoLabel
        gameInfoLabel.text = "UpDownGame Information Detail View"
    }
}
