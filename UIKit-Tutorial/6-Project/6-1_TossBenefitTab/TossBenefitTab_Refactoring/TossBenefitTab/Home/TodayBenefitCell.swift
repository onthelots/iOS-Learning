//
//  TodayBenefitCell.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/07.
//

import UIKit

class TodayBenefitCell: UICollectionViewCell {
    
    
    @IBOutlet weak var todayBenefitView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ctaButton: UIButton!
    
    
    func configure(item: Benefit) {
        titleLabel.text = item.title
        ctaButton.setTitle(item.ctaTitle, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.todayBenefitView.layer.masksToBounds = true
        self.todayBenefitView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
        self.todayBenefitView.layer.cornerRadius = 10 // view cornerRadius
        self.ctaButton.layer.masksToBounds = true
        self.ctaButton.layer.cornerRadius = 5
    }
    
    
    
}
