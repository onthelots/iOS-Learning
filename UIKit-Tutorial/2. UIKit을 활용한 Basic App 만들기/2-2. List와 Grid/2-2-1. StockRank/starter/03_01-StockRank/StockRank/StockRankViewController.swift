//
//  StockRankViewController.swift
//  StockRank
//
//  Created by Jae hyuk Yim on 2023/03/17.
//

import UIKit

class StockRankViewController: UIViewController {
    
    
    // MARK: - 지역변수 추가
    // 1. collecetionView (전체)
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - 어떤 데이터를 사용할까?
    let stocklist: [StockModel] = StockModel.list
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - dataSource, delegate는 모두 Protocol이며, 규칙이 담겨있음
        // 따라서, StockRankViewController의 기능을 확장시킬 필요가 있음 (Scope 바깥에 extension을 선언)
        // CollectionView의 데이터와 프레젠테이션은?
        collectionView.dataSource = self
        
        // CollcetionView를 어떻게 배치하나?
        collectionView.delegate = self
        
    }

}

// MARK: - dataSource, 즉 Data와 Presentation을 표현하기 위한 확장
extension StockRankViewController: UICollectionViewDataSource {
    
    // MARK: - UICollectionView를 구현하기 위해선?
    // 1. CollctionView에 몇개의 데이터가 들어오는가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 반환값으로, 데이터가 몇개가 들어오는지 알려줌 (위에서 선언한 'stocklist'의 배열 count 값을 선언)
        return stocklist.count
    }
    
    // MARK: - 2. Presentations : 셀을 어떻게 꾸미고 표현할까?
    // 2. CollectionView의 Presentation은 어떻게 표현되는가?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        // 'cell' 이란 지역 변수를 생성
        // 재 사용 가능한 셀, 즉 StockRankColletionViewCell을 구분자(Identifier)로 불러오며,
        // IndexPath(몇 번째)를 가져온다!
        
        // 그런데, 여기서 주의할 점! 커스텀 cell은 UICollectionView 타입이므로, 'StockRankCollectionViewCell' 데이터를 가져오기 위한 타입 캐스팅이 필요함
        // 그렇게 되면, cell은 옵셔널 타입의 StockRankCollectionViewCell 타입을 가지게 됨
        // [guard 조건문]을 활용, 옵셔널 바인딩 코드로 변환시켜 주자
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell",
                                                            for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // stocklist를 가져와야 하니, [stock] 지역변수를 생성한 후 -> stocklist와 '몇 번째에 해당하는' 인덱스 값[indexPath.item]을 할당받도록 함
        let stock = stocklist[indexPath.item]
        
        // 결과적으로, 커스텀 cell에서 Configure 메서드의 매개변수에 [stock]이란 StockModal 타입의 변수가 들어갈 수 있게 됨
        cell.configure(stock)
        
        return cell
    }
    
    
}

// MARK: - 3. Layout : 셀을 어떻게 배치할까?
// MARK: - delegate, 즉 Layout을 표현하기 위한 확장
// 채택하고 있는 UICollectionViewDelegateFlowLayout은 프로토콜이며,
// 셀의 속성(Layout)을 담당함
extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    
    // 그렇다면, 무슨 메서드를 가져와야 할까? -> SizeForIteamAT이 필요함!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // width == CollectionView의 layout 너비로 설정! (UICollectionView의 너비 사이즈를 가져오면 되겠지? -> width를 390으로 조정)
        // height = 80 정도?
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
