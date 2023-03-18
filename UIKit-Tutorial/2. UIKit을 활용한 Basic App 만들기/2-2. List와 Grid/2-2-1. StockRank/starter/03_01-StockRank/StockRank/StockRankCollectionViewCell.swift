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
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price))" // 문자열 보간 + 단위당 Comma(,)를 찍어주기 위해 convertToCurrencyFormat 함수를 실행한 후, 매개변수로 stock.price를 넘겨줌 (반환값인 result가 해당 companyPriceLabel.text(string값)으로 표현됨
        companyPriceRate.text = "\(stock.diff)%" // 문자열 보간
    }
    
    // MARK: - 숫자를 comma로 끊어서 표현하기 위한 메서드
    func convertToCurrencyFormat(price: Int) -> String {
        // 정수를 Formatting하는 메서드가 존재함 -> NumberFormatter()
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal // numberStyle 수정자를 통해 decimal 값을 할당함
        numberFormatter.maximumFractionDigits = 0
        
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        // 여기서 result는 옵셔널 타입이므로 강제 언래핑을 하거나, 옵셔널 바인딩을 실시해야 함 (옵셔널 바인딩을 선호하며, 빈 문자열로 넘겨줌)
        
        return result
    }
    
}
