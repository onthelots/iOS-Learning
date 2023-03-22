//
//  HomeViewController.swift
//  InstaSearchView
//
//  Created by Jae hyuk Yim on 2023/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // MARK: - flowlayout의 크기를 자동으로 맞추지 않도록 함
        // UICollectionViewFlowLayout 타입과 estimatedItemSize 활용
        // Inspector에서도 estimatedSize를 조정할 수 있음
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCell", for: indexPath) as? HomeViewCell else {
            return UICollectionViewCell()
        }
        let thumbnailAssets = "animal\(indexPath.item + 1)"
        
        cell.configure(thumbnailAssets)
        return cell
    }
}

// MARK: - !주의사항! 'Cell' 크기 자체를 변환시키는 extension임
// 따라서, 아래 CGSize로 변환 시, height 또한 collcectionView의 크기로 설정하거나, 별도의 layout 설정을 해야 함
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 282) // !! 이 부분은, 어찌되었던지 간에 계산을 통해 구해야 하는 부분임
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
