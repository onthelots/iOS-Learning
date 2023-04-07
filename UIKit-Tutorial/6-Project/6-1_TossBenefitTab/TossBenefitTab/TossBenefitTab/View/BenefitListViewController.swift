//
//  BenefitListViewController.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/07.
//

import UIKit

class BenefitListViewController: UIViewController {
    // 문제는, 각각의 Cell이 형태가 다름
    // 이를 CollectionView로 어떻게 만들어야 할까? -> CollectionView내부에 CollectionViewCell 추가!
    
    
    // 둘다 Hashable 프로토콜을 따르고 있기 때문에 Item에 할당해도 될것 같지만
    // 아래 DiffableDataSource의 Item 타입은 실제 타입이 포함되어야 하기 때문에 -> AnyHashable
    typealias Item = AnyHashable
    enum Section: Int {
        case today // MyPointCell, TodayBenefitCEll -> 0
        case other // otherPoint -> 1
    }
    
    // Item은, 실제 그 Model의 타입이 들어와야 함 (Hashable은 X)
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // MARK: - 2개 이상의 Model 받아오기(내부 데이터를 가지고 있는 전역상수)
    var todaySectionItem: [AnyHashable] = TodaySectionItem(point: .default, today: .today).sectionItems // sectionItems는 point와 today가 합쳐진 타입임
    var otherSectionItem: [AnyHashable] = Benefit.others
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            // Section은 0과 1 값을 가지고 있으며, 그 이외 값은 nil값으로 Return
            guard let section = Section(rawValue: indexPath.section) else { return nil }
            
            // 각각의 셀마다 section, view, items가 존재하는데, 이를 일일히 여기서 제시해 주기는 너무 길어 configureCell 메서드를 별도로 생성해서 지정함
            let cell = self.configureCell(
                for: section,
                item: item,
                collectionView: collectionView,
                indextPath: indexPath)

            
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.today, .other])
        snapshot.appendItems(todaySectionItem, toSection: .today)
        snapshot.appendItems(otherSectionItem, toSection: .other)
        dataSource.apply(snapshot)
        
        // navigation Bar
        navigationItem.title = "혜택"
        
        // layout
        collectionView.collectionViewLayout = layout()
    }
    
    // section별로 presentation을 설정해주기 위한 메서드
    private func configureCell(for section: Section, item: Item, collectionView: UICollectionView, indextPath: IndexPath) -> UICollectionViewCell? {
        
        switch section {
        case .today :
            if let point = item as? MyPoint {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPointCell", for: indextPath) as! MyPointCell
                cell.configure(item: point)
                return cell
            } else if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayBenefitCell", for: indextPath) as! TodayBenefitCell
                cell.configure(item: benefit)
                return cell
            } else {
                return nil
            }
            
        case .other :
            if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BenefitCell", for: indextPath) as! BenefitCell
                cell.configure(item: benefit)
                return cell
            } else {
                return nil
            }
        }
    }
    
    // layout()
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let spacing: CGFloat = 10
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.interItemSpacing = .fixed(spacing) // 그룹간의 Spacing
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = spacing // 내부 그룹간의 spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16) // today와 other간의 spacing
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
}

extension BenefitListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // item이 선택되었을 경우를 감지 (Snapshot으로 접근하고, IndexPath 인자값을 받아옴)
        let item = dataSource.itemIdentifier(for: indexPath)
        print("didSelected Item: \(item)") // 해당 item별 데이터가 찍히게 됨
    }
}
