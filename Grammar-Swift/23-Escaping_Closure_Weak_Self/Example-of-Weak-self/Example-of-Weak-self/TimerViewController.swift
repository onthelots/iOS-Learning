//
//  TimerViewController.swift
//  Example-of-Weak-self
//
//  Created by Jae hyuk Yim on 2023/07/18.
//

import UIKit

class TimerViewController: UIViewController {
    
    // Timer 메서드
    private var timer: Timer = Timer()
    
    // Count -> Timer에 따른 증가
    private var countNumber: Int = 0
    
    private let countNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Timer"
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(countNumberLabel)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            
            self.countNumber += 1
            
            // 로그
            print("CountNumber : \(self.countNumber)초")

            // countNumberLabel 업데이트
            self.countNumberLabel.text = "\(self.countNumber)"
        })
    }
    
    // Layout subviews()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            countNumberLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            countNumberLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            countNumberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            countNumberLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
        ])
    }
    
    // deinit, Stop Timer
    deinit {
        print("Memory Deinit")
        self.timer.invalidate()
    }
}






//

//timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
////            guard let countNumber = self?.countNumber else {
////                return
////            }
//
//    self.countNumber += 1
//
//    // 로그
//    print("CountNumber : \(countNumber)초")
//
////            guard let countNumberLabel = self?.countNumberLabel else {
////                return
////            }
//    // countNumberLabel 업데이트
//    self.countNumberLabel.text = "\(countNumber)"
//})
