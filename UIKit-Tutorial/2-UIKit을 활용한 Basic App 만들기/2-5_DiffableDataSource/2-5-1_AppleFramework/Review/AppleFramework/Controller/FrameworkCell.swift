//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    // MARK: - 컴포넌트 연결
    @IBOutlet weak var thumbNailUIImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Data 구성
    func configure(_ data: AppleFramework) {
        thumbNailUIImage.image = UIImage(named: data.imageName)
        nameLabel.text = data.name
    }

}
