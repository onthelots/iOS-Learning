//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/28.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var sectionHeaderLabel: UILabel!
    
    func configure(_ header: String) {
        sectionHeaderLabel.text = header
    }
}
