//
//  StockRankCollectionViewCell.swift
//  Practice
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    // MARK: - 1. 지역변수 선언
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var diff: UILabel!
    
    func configure(_ data: StockModel) {
        rank.text = "\(data.rank)" // 문자열 보간
        image.image = UIImage(named: data.imageName)
        name.text = "\(data.name)" // 문자열 보간
//        price.text = "\(data.price)" // 문자열 보간
        price.text = convertedToCurrencyFormat(price: data.price)
        
        diff.textColor = data.diff > 0 ? UIColor.systemBlue : UIColor.systemRed
        
        diff.text = "\(data.diff) %" // 문자열 보간
    }
    
    // MARK: - 숫자를 comma로 끊어서 표현하기 위한 메서드
    func convertedToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        
        return result
    }
}
