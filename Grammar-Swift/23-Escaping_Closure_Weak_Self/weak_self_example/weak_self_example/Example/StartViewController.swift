//
//  StartViewController.swift
//  weak_self_example
//
//  Created by Jae hyuk Yim on 2023/09/30.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - Components

    // 1. First Container Stack View (Vertical)
    private lazy var firstVerticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        verticalStackView.spacing = 10
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()

    // 1-1. Text Count Label
    private lazy var firstDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textAlignment = .right
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        label.sizeToFit()
        label.text = "Memory leak이 발생하는 경우"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // 1-2. Push Button
    private lazy var firstPushButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = "Click"
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.baseBackgroundColor = .systemRed
        let buttonView = UIButton(configuration: buttonConfiguration)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()

    // 2. First Container Stack View (Vertical)
    private lazy var secondVerticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        verticalStackView.spacing = 10
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()

    // 1-1. Text Count Label
    private lazy var secondDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textAlignment = .right
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        label.sizeToFit()
        label.text = "[Weak self]를 사용했을 경우"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // 1-2. Push Button
    private lazy var secondPushButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = "Click"
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.baseBackgroundColor = .systemTeal
        let buttonView = UIButton(configuration: buttonConfiguration)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Start"

        // push next viewController
        firstPushButton.addTarget(
            self,
            action: #selector(didTapFirstVCPushButton),
            for: .touchUpInside
        )

        // push next viewController
        secondPushButton.addTarget(
            self,
            action: #selector(didTapSecondVCPushButton),
            for: .touchUpInside
        )
    }

    // MARK: - Layout subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstVerticalStackView.addArrangedSubview(firstDescriptionLabel)
        firstVerticalStackView.addArrangedSubview(firstPushButton)
        view.addSubview(firstVerticalStackView)

        secondVerticalStackView.addArrangedSubview(secondDescriptionLabel)
        secondVerticalStackView.addArrangedSubview(secondPushButton)
        view.addSubview(secondVerticalStackView)

        NSLayoutConstraint.activate([
            firstVerticalStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            firstVerticalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200),

            secondVerticalStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            secondVerticalStackView.topAnchor.constraint(greaterThanOrEqualTo: firstVerticalStackView.bottomAnchor, constant: 50),
            secondVerticalStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
    }

    // MARK: - push next viewController (Action)
    @objc private func didTapFirstVCPushButton() {
        let firstVC = MemoryLeakCountViewController()
        firstVC.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(firstVC, animated: true) // Reference Count +1
    }

    @objc private func didTapSecondVCPushButton() {
        let secondVC = UseWeakSelfViewController()
        secondVC.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(secondVC, animated: true) // Reference Count +1
    }
}
