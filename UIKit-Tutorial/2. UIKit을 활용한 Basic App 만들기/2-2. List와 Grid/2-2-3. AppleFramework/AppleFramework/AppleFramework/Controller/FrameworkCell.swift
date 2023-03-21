//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
    
    
}
