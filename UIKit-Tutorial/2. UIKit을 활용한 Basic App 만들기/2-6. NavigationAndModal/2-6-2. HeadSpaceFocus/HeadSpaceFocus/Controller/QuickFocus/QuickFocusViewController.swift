//
//  QuickFocusViewController.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/28.
//

import UIKit

class QuickFocusViewController: UIViewController {
    
    // MARK: - QuickFocus에서 왜 따로 가져오나..?
    // Indexing 값이 사용해야 하며, 각각의 다른 배열이 존재하기 때문
    // let quickFocusList = QuickFocus( ... 초기값...) 형식으로 데이터를 가져오지 않음!
    let breathingList: [QuickFocus] = QuickFocus.breathing
    let walkingList: [QuickFocus] = QuickFocus.walking
    
    // MARK: - Section 및 Item(Data) 선언
    
    typealias Item = QuickFocus
    
    // MARK: - CaseIterable 프로토콜 채택 (Section의 모든 Case를 가져올 수 있음)
    enum Section: CaseIterable {
        case breathe
        case walking
        
        // 타이틀 설정을 위한 연산 프로퍼티 생성
        var title: String {
            switch self {
            case .breathe: return "Breathing exercises"
            case .walking: return "Mindful walks"
            }
        }
    }
    
    var DataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Section.allCases
// 위 코드와 동일 -> let allItems: [Section] = [.breathe, .walking]
        
        // MARK: - Presentation
        DataSource = UICollectionViewDiffableDataSource<Section, Item> (collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell", for: indexPath) as? QuickFocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // MARK: - Data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.breathe, .walking])
        snapshot.appendItems(breathingList, toSection: .breathe)
        snapshot.appendItems(walkingList, toSection: .walking)
        
        DataSource.apply(snapshot)
        
        // MARK: - Layout
        
        collectionView.collectionViewLayout = layout()
    }
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: <#T##NSCollectionLayoutDimension#>, heightDimension: <#T##NSCollectionLayoutDimension#>)
        
        let item = NSCollectionLayoutItem(layoutSize: <#T##NSCollectionLayoutSize#>)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: <#T##NSCollectionLayoutDimension#>, heightDimension: <#T##NSCollectionLayoutDimension#>)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: <#T##NSCollectionLayoutSize#>, repeatingSubitem: <#T##NSCollectionLayoutItem#>, count: <#T##Int#>)
        
        let section = NSCollectionLayoutSection(group: <#T##NSCollectionLayoutGroup#>)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
