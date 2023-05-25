//
//  ViewController.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.main.async {
            self.mainView.backgroundColor = UIColor.systemGreen
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

