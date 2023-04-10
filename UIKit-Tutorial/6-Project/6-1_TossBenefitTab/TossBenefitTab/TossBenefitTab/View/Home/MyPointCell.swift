//
//  MyPointCell.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/07.
//

import UIKit

class MyPointCell: UICollectionViewCell {
    
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var descripitonLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    func configure(item: MyPoint) {
        iconView.image = UIImage(named: "ic_point")
        descripitonLabel.text = "내 포인트"
        pointLabel.text = "\(item.point)원"
    }
    
}
