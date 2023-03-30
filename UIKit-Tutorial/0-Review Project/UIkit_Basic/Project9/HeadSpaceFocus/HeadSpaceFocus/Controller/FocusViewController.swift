//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/29.
//

import UIKit

class FocusViewController: UIViewController {

    // Model
    var focusList: [Focus] = Focus.list

    // CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    // ButtonLabel Components & Flag
    var isTapped: Bool = false
    
    @IBOutlet weak var refreshButton: UIButton!
    // Data
    enum Section {
        case main
    }
    typealias Item = Focus
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Presentation(UICollectionViewDiffableDataSource)
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // Data(NSDiffableDataSourceSnapshot)
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusList, toSection: .main)
        dataSource.apply(snapshot)
        
        // Layout
        collectionView.collectionViewLayout = layout()
        
        updateButtonTitle()
    }
    // Layout Deatil (CompositionalLayout)
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 10 // 그룹간의 InterSpacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func updateButtonTitle() {
        let title = isTapped ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal) // setTitle을 통해 업데이트
    }
    
    @IBAction func changeListButton(_ sender: Any) {
        isTapped.toggle() // toggle -> updateButtonTitle() 메서드 관여
        
        self.focusList = isTapped ? Focus.recommendations : Focus.list
        // focusList의 값을 Toggle Boolean 값을 통해 변환
        
        // 데이터 업데이트
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>() // 다시 데이터를 비워주고
        snapshot.appendSections([.main])
        snapshot.appendItems(focusList, toSection: .main)
        dataSource.apply(snapshot)
        
        updateButtonTitle()
    }
    
}
