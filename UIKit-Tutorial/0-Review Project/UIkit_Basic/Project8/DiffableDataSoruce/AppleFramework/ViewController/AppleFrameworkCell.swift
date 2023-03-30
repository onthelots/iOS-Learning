//
//  AppleFrameworkCell.swift
//  DiffableDataSoruce
//
//  Created by Jae hyuk Yim on 2023/03/26.
//

import UIKit

class AppleFrameworkCell: UICollectionViewCell {
    @IBOutlet weak var iconImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImage.image = nil
    }
    
    func configure(_ framework: AppleFramework) {
        iconImage.image = UIImage(named: framework.imageName)
    }
}
