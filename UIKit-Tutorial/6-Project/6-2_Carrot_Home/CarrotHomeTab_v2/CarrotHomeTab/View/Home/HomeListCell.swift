//
//  HomeListCell.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/13.
//

import UIKit
import Kingfisher

class HomeListCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImage.layer.cornerRadius = 5
    }
    
    func configure(item: ItemInfo) {
        self.thumbnailImage.kf.setImage(with: URL(string: item.thumbnailURL))
        self.titleLabel.text = item.title
        self.locationLabel.text = item.location
        self.priceLabel.text = "\(item.price)원"
    }
}
