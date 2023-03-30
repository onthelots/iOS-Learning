//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/24.
//

import UIKit

class FocusCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherUIImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ item: Focus) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        
        // RenderingMode의 디폴트 값은 .alwaysTemplate임 (tint 색상만 보이게 됨)
        // 따라서, 이를 multicolor로 조정하기 위해 .alwaysOriginal로 수정해줘야 함
        weatherUIImage.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
    }
    
}
