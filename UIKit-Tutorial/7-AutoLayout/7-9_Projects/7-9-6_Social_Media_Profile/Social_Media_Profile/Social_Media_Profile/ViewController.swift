//
//  ViewController.swift
//  Social_Media_Profile
//
//  Created by Jae hyuk Yim on 2023/06/19.
//

import UIKit

// Intrinsic content Size Custom
class MyImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric,
               height: UIView.noIntrinsicMetric)
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

