//
//  ViewController.swift
//  Dynamic_Type
//
//  Created by Jae hyuk Yim on 2023/06/13.
//

import UIKit

class ViewController: UIViewController {

    // stackView
    @IBOutlet weak var stackView: UIStackView!
    
    // buttons
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(adjustButtonDynamicType),
                                               name: UIContentSizeCategory.didChangeNotification,
                                               object: nil)
    }
    
    // Button에 Dynamic Type 적용하기
    @objc func adjustButtonDynamicType() {
        buttons.forEach { (button) in
            // adjustsFontForContentSizeCategory 적용
            button.titleLabel?.adjustsFontForContentSizeCategory = true
        }
    }
    
    
    
    
    @IBAction func addLabel(_ sender: Any) {
        let label = UILabel()
        
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.text = """
Hello world
Hello world
Hello world
Hello world
Hello world
Hello world
Hello world
Hello world
"""
        label.isHidden = true
        stackView.addArrangedSubview(label)
        
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }
    
    
    @IBAction func removeLabel(_ sender: Any) {
        guard let lastLabel = stackView.arrangedSubviews.last else { return }
        
        lastLabel.isHidden = false
        
        UIView.animate(withDuration: 0.3) {
            lastLabel.isHidden = true
        } completion: { (_) in
            self.stackView.removeArrangedSubview(lastLabel)
        }

    }
}

