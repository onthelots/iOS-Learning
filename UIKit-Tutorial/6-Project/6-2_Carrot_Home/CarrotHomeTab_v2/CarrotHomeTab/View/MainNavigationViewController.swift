//
//  MainNavigationViewController.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/11.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backArrowImage = UIImage(systemName: "arrow.backward")
        
        // navigationBar backButton 커스터마이징
        navigationBar.backIndicatorImage = backArrowImage
        navigationBar.backIndicatorTransitionMaskImage = backArrowImage
        navigationBar.tintColor = .label
    }
}
