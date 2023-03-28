//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/28.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descripitonLabel: UILabel!
    
    func configure(_ quickFocus: QuickFocus) {
        thumbnailImageView.image = UIImage(named: quickFocus.imageName)
        titleLabel.text = quickFocus.title
        descripitonLabel.text = quickFocus.title
    }
}


