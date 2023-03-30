//
//  StockRankViewController.swift
//  Practice
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class StockRankViewController: UIViewController {
    
    // MARK: - 등록
    @IBOutlet weak var collcetionView: UICollectionView!
    
    // MARK: - Model(data) 가져오기
    
    let stockModel: [StockModel] = StockModel.list
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collcetionView.dataSource = self
        collcetionView.delegate = self
        
    }
    
}

extension StockRankViewController: UICollectionViewDataSource {
    
    // 1. Data (데이터 갯수)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockModel.count
    }
    
    // 2. Presentation (나타내는 방법)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // MARK: - 가장 헷갈리는 부분
        // MARK: - !!!!! stock변수는 stockModel의 Index별 Item을 할당 받을 것이고..
        let stock = stockModel[indexPath.item]
        
        // configure 메서드(Data를 지역변수와 연결)를 실행하는데, 매개변수로 stock(Data) 내 list 값을 가져오게 됨
        // 헷갈리는 부분인게, StockRankCollectionViewCell에서 선언한 configure 메서드에서는 데이터를 가져오지 않았음!
        cell.configure(stock)
        // 따라서, 해당 데이터를 ViewController에서 가져오기 위해, 'cell'(StockRankCollectionViewCell 타입)을 선언한 후,
        // 점문법을 통해 configure 메서드를 활용하되, 매개변수로 들어가는 데이터는 앞서 선언한 'stock' (stockModel의 인덱스 값)을 할당해줌
                               
        return cell // 이후, cell 자체를 리턴하면됨
    }
}

// 3. Layout (View의 높이, 너비, Padding 외..)
extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}

