//
//  CountViewController.swift
//  weak_self_example
//
//  Created by Jae hyuk Yim on 2023/09/30.
//

import UIKit

class MemoryLeakCountViewController: UIViewController {

    private var countNumber: Int = 0

    // MARK: - Components
    // 1. Timer
    private lazy var timer: Timer = Timer()

    // 2. Count Label
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 1
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Counting System"

        setTimer()
    }

    // MARK: - Timer Setting -> 메모리 누수가 진행됨
    // setTimer 메서드에서 'self'를 통해 현재 ViewController를 캡쳐하고 있음.
    // 따라서, 이전 StartViewController로 이동할 시 deinit 메서드가 실행되지 않고, 지속적으로 Reference Count가 남아 있어 메모리 누수가 진행됨
    private func setTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.countNumber += 1
            print("---> 현재 Count : \(self.countNumber)")
            // countLabel text값 할당
            self.countLabel.text = "\(self.countNumber)"
        })
    }

    // MARK: - Layout subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        view.addSubview(countLabel)
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }

    // MARK: - deinit (메모리에서 해제되는지 여부 파악) --> 실행되지 않음
    deinit {
        print("Count 값이 메모리에서 해제되었습니다")
        self.timer.invalidate()
    }
}
