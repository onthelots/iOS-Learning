//
//  OnboardingCell.swift
//  NRCOnboarding
//
//  Created by Jae hyuk Yim on 2023/03/23.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailsImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - configure 메서드 생성
    func configure(_ message: OnboardingMessage) {
        thumbnailsImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
    
    
}
