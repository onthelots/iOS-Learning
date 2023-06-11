//
//  ViewController.swift
//  Constraint_With_Code
//
//  Created by Jae hyuk Yim on 2023/06/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // constraint with code
        // [blueButton]은 safeArea의 leading, trailing, bottom을 기준으로 20씩 떨어져 있음
    }
}

