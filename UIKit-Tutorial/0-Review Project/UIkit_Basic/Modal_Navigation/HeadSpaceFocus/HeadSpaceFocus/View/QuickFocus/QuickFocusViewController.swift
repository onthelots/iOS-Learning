//
//  QuickFocusViewController.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/30.
//

import UIKit

class QuickFocusViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var breathingList: [QuickFocus] = QuickFocus.breathing
    var walkingList: [QuickFocus] = QuickFocus.walking
    
    // MARK: - CastItable 프로토콜 채택 (Section의 모든 Case를 가져올 수 있음)
    enum Section: CaseIterable {
        case breathing
        case walking
        
        // Enum 내부에 연산 프로퍼티 생성
        var title: String {
            switch self {
            case .breathing: return "Breathing exercises"
            case .walking: return "Mindful walks"
            }
        }
    }
    
    typealias Item = QuickFocus
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        // Section별 정보를 가져오기 위한 선언(아래 두 코드는 동일함)
//        let allItems: [Section] = [.breathing, .walking]
//        Section.allCases
        
        // Presentation (QuickFocusCell)
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, items in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell", for: indexPath) as? QuickFocusCell else {
                return nil
            }
            cell.configure(items)
            return cell
        })
        
        // MARK: - Present2 (TitleReusableView) -> supplementaryViewProvider
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            guard let title = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                              withReuseIdentifier: "TitleReusableView",
                                                                              for: indexPath) as? TitleReusableView else {
                return nil
            }
            // Section 정보 불러오기
            let allSection = Section.allCases
            // section -> 2개 섹션의 IndexPath값
            let section = allSection[indexPath.section]
            // title(TitleReusableView) 내부 메서드인 Configure 불러오기
            title.configure(title: section.title)
            // 리턴
            return title
        }
        
        
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.breathing, .walking])
        // Section이 2개이니, 둘다 snapshot에 넣어줌
        snapshot.appendItems(breathingList, toSection: .breathing)
        snapshot.appendItems(walkingList, toSection: .walking)
        dataSource.apply(snapshot)
        
        // layout
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50))
        
        let items = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: items, count: 2)
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 30)
        section.interGroupSpacing = 20
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
