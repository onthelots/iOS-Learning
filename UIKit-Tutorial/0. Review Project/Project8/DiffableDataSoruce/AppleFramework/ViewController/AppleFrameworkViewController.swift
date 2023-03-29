//
//  AppleFrameworkViewController.swift
//  DiffableDataSoruce
//
//  Created by Jae hyuk Yim on 2023/03/26.
//

import UIKit

class AppleFrameworkViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let frameworks: [AppleFramework] = AppleFramework.list
    
    // MARK: - 2. DiffableDataSource 활용
    // 2개의 타입을 설정해서 가져옴
    typealias Item = AppleFramework // Item을 타입 엘리어스로 하나 선언하구
    
    enum Section { // Section의 case를 추가함
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>! // 최종적으로, dataSource는 DiffableDataSource 형태의 제네릭 타입
    // SectionItem과 ItemIdentifier의 경우, 제네릭 타입이므로 함수 내부에서 타입을 결정함
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 2. DiffableDataSource 활용
        // Data, Presentation, Layout
        
        // -- Presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleFrameworkCell", for: indexPath) as? AppleFrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // -- Data
        // 데이터를 수동으로 가져오는게 아닌 'snapshot'으로 찍어서 변화되는 내용까지 감지할 수 있도록 함
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>() // 빈 배열 형태의 snapshot
        
        // snapshot에 append (Section과 Items)
        snapshot.appendSections([.main]) // append
        snapshot.appendItems(frameworks, toSection: .main)
        
        // snapshot을 찍었으니, 이제 dataSource에서 승인해줘야 가져올 수 있음!
        dataSource.apply(snapshot)
        
        // Layout
        collectionView.collectionViewLayout = layout()
        
        
        // MARK: - 1. 기존 방식 (dataSource, Delegate)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        navigationItem.title = "😀 Apple Frameworks"
//
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.estimatedItemSize = .zero
//        }
//
//        // 컬렉션뷰 전체의 Inset(padding) 값을 부여하는 과정
//        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//
    }
    // -- Layout -> UICollectionViewCompositionalLayout
    func layout() -> UICollectionViewCompositionalLayout {
        
        // Size를 잡아주는 fraction은 전체 collcetionView.bounds에 대한 비율로 볼 수 있을듯
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

//extension AppleFrameworkViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleFrameworkCell", for: indexPath) as? AppleFrameworkCell else {
//            return UICollectionViewCell()
//        }
//
//        let datalist = frameworks[indexPath.item]
//        cell.configure(datalist)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return frameworks.count
//    }
//}
//
//extension AppleFrameworkViewController: UICollectionViewDelegateFlowLayout {
//
//    // MARK: - 기억! 여긴 Item 하나 당 사이즈를 조정(Fix)하는 내부 메서드임
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let interItemSpacing: CGFloat = 10 // 사이 사이에 틈 width (이것도 별도로 빼줘야지)
//
//        let padding: CGFloat = 10 // CollcetionViewdml padding 값을
//
//        // 10(collectionView Padding, padding) |item| 10(interItemSpacing) |item| 10(interItemSpacing) |item| '10'(collectionView Padding, padding)
//        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
//        let height = width
//
//        return CGSize(width: width, height: height)
//
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
