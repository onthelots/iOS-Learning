//
//  MainViewController.swift
//  Example-of-Weak-self
//
//  Created by Jae hyuk Yim on 2023/07/18.
//

import UIKit

class MainViewController: UIViewController {
    
    // button
    private let pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        self.view.backgroundColor = .systemBackground
        
        // Navigation Push Button
        view.addSubview(pushButton)
        
        // Button Action
        pushButton.addTarget(self,
                             action: #selector(didTapPushButton),
                             for: .touchUpInside)
    }
    
    // Layout subviews()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            pushButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            pushButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100)
        ])
    }
    
    @objc private func didTapPushButton() {
        // navigation
        let vc = TimerViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
