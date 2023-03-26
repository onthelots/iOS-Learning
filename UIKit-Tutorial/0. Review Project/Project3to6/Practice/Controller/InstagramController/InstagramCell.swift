//
//  InstagramCell.swift
//  Practice
//
//  Created by Jae hyuk Yim on 2023/03/26.
//

import UIKit

class InstagramCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    // MARK: - Reusable전, 무한 스크롤을 없애기 위해 준비하는 함수
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailImage.image = nil // nil값으로 설정해주고..
    }
    
    func configure(_ image: String) {
        thumbnailImage.image = UIImage(named: image)
    }
}
