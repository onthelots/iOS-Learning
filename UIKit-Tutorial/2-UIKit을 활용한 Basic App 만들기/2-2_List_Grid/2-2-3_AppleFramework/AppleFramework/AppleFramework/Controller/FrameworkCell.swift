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
    
    // MARK: - awakeFromNib()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // numberOfLines -> 해당 Label의 text의 줄(Line)의 값을 표시
        nameLabel.numberOfLines = 1
        // Label text의 font Size를 자동으로 맞춤 (Bool type)
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
