//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/29.
//

import UIKit

class FocusCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherUIImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // group = contentView layout
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = UIColor.systemIndigo
        
    }
    func configure(_ focus: Focus) {
        titleLabel.text = focus.title
        descriptionLabel.text = focus.description
        weatherUIImage.image = UIImage(systemName: focus.imageName)?.withRenderingMode(.alwaysOriginal)
    }
}
