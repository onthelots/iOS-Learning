//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // MARK: - 재 사용 전, 준비하는 함수가 존재함
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // image를 reset
        thumbnailImageView.image = nil
    }
    
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
