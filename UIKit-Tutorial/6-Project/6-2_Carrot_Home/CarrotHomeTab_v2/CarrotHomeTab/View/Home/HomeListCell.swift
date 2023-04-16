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
    
    @IBOutlet weak var numOfLikeLabel: UILabel!
    @IBOutlet weak var numOfChatsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImage.layer.cornerRadius = 10
        thumbnailImage.layer.masksToBounds = true
        thumbnailImage.tintColor = .systemGray
    }
    
    func configure(item: ItemInfo) {
        
        // kingfisher -> placeholder 추가
        self.thumbnailImage.kf.setImage(with: URL(string: item.thumbnailURL)!,
                                        placeholder: UIImage(systemName: "hands.sparkles.fill"))
        self.titleLabel.text = item.title
        self.locationLabel.text = item.location 
        self.priceLabel.text = "\(convertToString(price: item.price))원"
        
        self.numOfLikeLabel.text = "\(item.numOfLikes)"
        self.numOfChatsLabel.text = "\(item.numOfChats)"
    }
    
    // convert to formatting -> Comma 끊어서 작성하기
    func convertToString(price: Int) -> String {
        let numberConverting = NumberFormatter()
        numberConverting.numberStyle = .decimal
        numberConverting.maximumFractionDigits = 0
        
        let result = numberConverting.string(from: NSNumber(value: price)) ?? ""
        return result
    }
}
