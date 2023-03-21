//
//  HomeViewCell.swift
//  InstaSearchView
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animalUIImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        animalUIImage.image = nil
    }
    
    
    func configure(_ imageName: String) {
        animalUIImage.image = UIImage(named: imageName)
    }
}
