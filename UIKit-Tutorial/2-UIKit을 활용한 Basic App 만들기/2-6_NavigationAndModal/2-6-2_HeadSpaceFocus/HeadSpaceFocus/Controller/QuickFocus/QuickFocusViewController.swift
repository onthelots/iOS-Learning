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
    enum Section: CaseIterable, Hashable {
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell",
                                                                for: indexPath) as? QuickFocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // MARK: - Presentataion - QuickFocusHeaderView(Collection Reusable View) 내부에 선언된 sectionheader의 데이터를 연걸해 주기 위한 메서드(클로저)
        // supplementaryViewProvider
        DataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                               withReuseIdentifier: "QuickFocusHeaderView",
                                                                               for: indexPath) as? QuickFocusHeaderView else {
                return nil
            }
            // Section이 2개잖아? -> allCases 수정자로 가져오고,
            let allSectios = Section.allCases
            
            // 해당 section은 모든 섹션에서 indexPath를 불러온 후
            let section = allSectios[indexPath.section]
            
            // header 내부 메서드인 Configure를 통해 컴포넌트의 값을 'section'(모든 섹션의 IndexPath)의 title 값으로 한번 더 들어가서 뿌려줌
            header.configure(section.title)
            
            return header
        }
        
        
        // MARK: - Data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.breathe, .walking])
        snapshot.appendItems(breathingList, toSection: .breathe)
        snapshot.appendItems(walkingList, toSection: .walking)
        
        DataSource.apply(snapshot)
        
        // MARK: - Layout
        
        collectionView.collectionViewLayout = layout()
        
        // Large 타이틀이 아닌, 그냥 타이틀 형식으로 -> largeTitleDisplyMode = never!
        self.navigationItem.largeTitleDisplayMode = .never

    }
    // MARK: - layout의 경우, 해당 View에서만 활용하므로 private 키워드를 붙임
    // NSCollectionLayoutItem을 설정하는 .fraction, .estimated, .absolute를 잘 알아두자
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)

        // MARK: - group 내부의 item 간의 Spacing (interItemSpacing), fixed(CGFloat)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        // MARK: - Section간의 Spacing (contentInsets) NSDircetionEdgeInsets
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20)
        
        // MARK: - Section 내부에 있는 Group간의 Spacing (interGroupSpacing)
        section.interGroupSpacing = 20
        
        // MARK: - header 사이즈 결정
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
