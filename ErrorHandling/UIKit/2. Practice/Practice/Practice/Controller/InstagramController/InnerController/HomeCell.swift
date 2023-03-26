//
//  HomeCell.swift
//  Practice
//
//  Created by Jae hyuk Yim on 2023/03/26.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbNailImage: UIImageView!
    
    // MARK: - Image 초기화
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbNailImage.image = nil
    }
    
    func configure(_ image: String) {
        thumbNailImage.image = UIImage(named: image)
    }
}
