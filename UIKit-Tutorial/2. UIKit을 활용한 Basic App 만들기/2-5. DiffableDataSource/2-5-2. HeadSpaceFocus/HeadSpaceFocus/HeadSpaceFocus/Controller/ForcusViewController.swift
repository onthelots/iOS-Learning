//
//  ForcusViewController.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/24.
//

import UIKit

class ForcusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    // MARK: - Button의 라벨을 바꾸기 위한 flag
    var curated: Bool = false
    
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
        
        refreshButton.layer.shadowOffset = .init(width: 1, height: 1)
        updateButtonTitle()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
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
    
    // MARK: - Button의 라벨 변경
    func updateButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        // setTitle의 인자값으로 위에 선언한 title을 할당
        refreshButton.setTitle(title, for: .normal)
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        
        curated.toggle() // 토글 Action 추가
        
        // items(Focus 구조체에 선언된 배열 데이터들)이 true일땐 recommendation을, 그렇지 않으면 list를
        self.items = curated ? Focus.recommendations : Focus.list
        
        // MARK: - 그럼 업데이트는?? -> 똑같이 snapshot 로직을 돌려줌
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([.main])
        // 대신, 여기서 items는 위에서 toggle()값을 할당한 items여야겠지
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
        
        updateButtonTitle()
    }
}
