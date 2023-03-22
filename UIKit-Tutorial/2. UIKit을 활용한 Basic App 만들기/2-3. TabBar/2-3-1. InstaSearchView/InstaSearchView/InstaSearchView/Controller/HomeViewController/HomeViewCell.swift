//
//  HomeViewCell.swift
//  InstaSearchView
//
//  Created by Jae hyuk Yim on 2023/03/22.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        thumbnailImage.image = nil
//    }
    // MARK: - Data 할당 메서드
    func configure(_ imageName: String) {
        thumbnailImage.image = UIImage(named: imageName)
    }
}
