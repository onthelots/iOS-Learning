//
//  ViewController.swift
//  Floating_Button
//
//  Created by Jae hyuk Yim on 2023/06/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // menuButton 추가
        let menuButton = MenuButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
        
        menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -20).isActive = true
        
        menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                             constant: -20).isActive = true
    }
}

