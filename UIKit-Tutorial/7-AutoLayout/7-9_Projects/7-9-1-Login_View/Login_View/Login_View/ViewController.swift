//
//  ViewController.swift
//  Login_View
//
//  Created by Jae hyuk Yim on 2023/06/13.
//

import UIKit

/*
 [ ] StackView 연결 및 Attributes 설정
 [ ] 내부 Componets Size(Font 외) 조정
 [ ] Spacing 간격 조정 (priority 적용)
 [ ] Dynamic Type 설정
 */

class ViewController: UIViewController {

    // 전체 StackView
    @IBOutlet var stackView: UIStackView!
    
    // 내부 Components
    @IBOutlet var buttons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // button setting
        buttons.forEach { (button) in
            button.titleLabel?.adjustsFontForContentSizeCategory = true
        }
    }
}

