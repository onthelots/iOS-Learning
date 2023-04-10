//
//  MyPointViewController.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/10.
//

import UIKit

class MyPointViewController: UIViewController {
    
    var points: MyPoint = .default // 포인트 데이터 가져오기

    @IBOutlet weak var pointOutButton: UIButton!
    @IBOutlet weak var pointUseButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addPointButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pointOutButton.layer.cornerRadius = 10
        self.pointUseButton.layer.cornerRadius = 10
        self.addPointButton.layer.cornerRadius = 10
        
        navigationItem.largeTitleDisplayMode = .never
    }
}
