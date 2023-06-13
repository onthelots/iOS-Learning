//
//  ViewController.swift
//  Dynamic_Scroll_View
//
//  Created by Jae hyuk Yim on 2023/06/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addView() {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isHidden = true
        
        label.text = """
asdfasdfa
asdfasdf
asdfasdfasdfasdf
asdfasdf
asdfasdfasdf
asdfasdf
adsfasdf
"""
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        
        stackView.addArrangedSubview(label)
        
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
        
    }
    
    @IBAction func removeView() {
        guard let last = stackView.arrangedSubviews.last else { return }
        
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { (_) in
            self.stackView.removeArrangedSubview(last)
        }
    }
}

