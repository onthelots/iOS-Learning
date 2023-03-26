//
//  OnboardingCell.swift
//  PagingView
//
//  Created by Jae hyuk Yim on 2023/03/26.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Configure 데이터 함수
    func configure(_ message: OnboardingMessage) {
        thumbnailImage.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
}
