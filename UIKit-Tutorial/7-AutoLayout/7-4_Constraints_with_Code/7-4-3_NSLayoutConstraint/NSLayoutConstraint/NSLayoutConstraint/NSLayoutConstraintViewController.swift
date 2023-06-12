//
//  NSLayoutConstraintViewController.swift
//  NSLayoutConstraint
//
//  Created by Jae hyuk Yim on 2023/06/12.
//

import UIKit

class NSLayoutConstraintViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Custom Button
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        // Constraints를 사용하기 위한 코드
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // safeArea
        let safeArea = view.safeAreaLayoutGuide
        
        // NSLayoutConstraints
        
        // leading
        let leading = NSLayoutConstraint(item: button,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: safeArea,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: 16)
        // trailing
        let trailing = NSLayoutConstraint(item: button,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: safeArea,
                                          attribute: .trailing,
                                          multiplier: 1,
                                          constant: -16)
        
        // bottomSafeArea (우선도가 낮은) 
        let bottomSafeArea = NSLayoutConstraint(item: button,
                                                attribute: .bottom,
                                                relatedBy: .equal,
                                                toItem: safeArea,
                                                attribute: .bottom,
                                                multiplier: 1,
                                                constant: 0)
        bottomSafeArea.priority = .defaultLow
        
        // bottomView (우선도가 높은)
        let bottomView = NSLayoutConstraint(item: button,
                                            attribute: .bottom,
                                            relatedBy: .lessThanOrEqual,
                                            toItem: view,
                                            attribute: .bottom,
                                            multiplier: 1,
                                            constant: -20)
        
        // Active
        NSLayoutConstraint.activate([leading, trailing, bottomSafeArea, bottomView])

    }
}
