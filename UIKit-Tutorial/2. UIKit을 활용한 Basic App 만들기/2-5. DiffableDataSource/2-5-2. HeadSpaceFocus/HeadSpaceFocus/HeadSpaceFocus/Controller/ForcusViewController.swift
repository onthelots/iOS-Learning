//
//  ForcusViewController.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/24.
//

import UIKit

class ForcusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Focus] = Focus.list
    
    typealias Item = Focus
    
    // 현재도 단일 section
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Data, Presentation, Layout
        
        // MARK: - Presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // MARK: - Data (SnapShot)
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
        
        // MARK: - Layout (CompositionalLayout)
        collectionView.collectionViewLayout = layout()
    }
    
    func layout() -> UICollectionViewCompositionalLayout {
        
        // MARK: - estimated? (content에 따라서 변경이 될 수 있음) -> 일종의 동적 요소 (AutoLayout에서 잡아주지 않은 이유가 있음)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item]) // 배열
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        // MARK: - 그룹간의 Spacing
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
