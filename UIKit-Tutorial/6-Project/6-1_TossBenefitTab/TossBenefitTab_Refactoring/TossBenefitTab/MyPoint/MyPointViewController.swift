//
//  MyPointViewController.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/10.
//

import UIKit
import Combine

class MyPointViewController: UIViewController {
    
    
    var myPointViewModel: MyPointViewModel!
    var subscriptions = Set<AnyCancellable>()

    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var pointOutButton: UIButton!
    @IBOutlet weak var pointUseButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addPointButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        self.pointOutButton.layer.cornerRadius = 10
        self.pointUseButton.layer.cornerRadius = 10
        self.addPointButton.layer.cornerRadius = 10
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func bind() {
        myPointViewModel.$points
            .receive(on: RunLoop.main)
            .sink { point in
                self.pointLabel.text = "\(point.point)원"
            }.store(in: &subscriptions)
    }
}
