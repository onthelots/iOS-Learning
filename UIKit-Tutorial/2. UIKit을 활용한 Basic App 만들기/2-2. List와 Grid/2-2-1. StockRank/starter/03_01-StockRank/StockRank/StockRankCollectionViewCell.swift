//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by Jae hyuk Yim on 2023/03/17.
//

import UIKit

// MARK: - 해당 UICollectionView를 활용하기 위한 별도의 CollectionViewCell 만들어 주기 (클래스로..)
// 해당 코드는 View에 위치한 StockRankCollectionViewCell과 연계되어 활용됨

class StockRankCollectionViewCell: UICollectionViewCell {
    
    // 아래 2가지를 수행해야 함
    // 1. UIComponents를 연결해야 함
    // 2. UIComponents에 데이터를 업데이트 하는 코드가 필요함
    
    
    @IBOutlet weak var rankLabel: UILabel!
    
    @IBOutlet weak var companyIcon: UIImageView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    
    @IBOutlet weak var companyPriceLabel: UILabel!
    
    @IBOutlet weak var companyPriceRate: UILabel!
    
    
    func configure(_ stock: StockModel) {
        
        rankLabel.text = "\(stock.rank)" // 문자열 보간
        companyIcon.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(stock.price)원" // 문자열 보간
        companyPriceRate.text = "\(stock.diff)%" // 문자열 보간
    }
    
}
