//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/30.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(_ items: QuickFocus) {
        thumbnailImage.image = UIImage(named: items.imageName)
        titleLabel.text = items.title
        descriptionLabel.text = items.description
    }
}
