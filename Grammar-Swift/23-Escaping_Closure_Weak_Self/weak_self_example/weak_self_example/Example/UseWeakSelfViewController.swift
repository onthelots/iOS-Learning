//
//  UseWeakSelfViewController.swift
//  weak_self_example
//
//  Created by Jae hyuk Yim on 2023/09/30.
//

import UIKit

class UseWeakSelfViewController: UIViewController {

    private var countNumber: Int = 0

    // MARK: - Components
    // 1. Timer
    private lazy var timer: Timer = Timer()

    // 2. Count Label
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.textColor = .systemTeal
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

    // MARK: - Timer Setting -> [Weak self]를 통해 약한 참조를 하는 경우
    private func setTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            // 1. 메서드 내부에서 참조하는 'self'(ViewController)에 대한 Optional Binding을 실시함 (왜냐면, 약한 참조를 할 경우 객체는 반드시 Optioanl 타입 이므로)
            guard let self = self else { return }
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

    // MARK: - deinit (메모리에서 해제되는지 여부 파악)
    // -> [Weak self]를 활용하였으므로, 이전 StartViewController로 이동할 시 deinit 메서드가 실행됨
    deinit {
        print("Count 값이 메모리에서 해제되었습니다")
        self.timer.invalidate()
    }
}
