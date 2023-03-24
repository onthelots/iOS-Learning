//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    // MARK: - DataSource가 무슨 타입일까?
    // Section은 Presentation과 연결되어 있으며
    // Item은 Data와 연결됨
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    // 따라서, 활용하는 dataSource는 DiffableDataSource 타입이며, 제네릭 타입으로 위에서 선언한 Section과 Item을 받아옴
    // 해당 Section과 Item은 nil값일 수 있으므로, 강제 바인딩을 실행시켜 줌
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        // MARK: - 새로운 방식으로 작성하는 Data, Presentation, Layout
        // 각각 누가 담당하나?
        
        // MARK: - Presentation -> diffable DataSource (데이터를 어디서, 어떻게 보여줄껀데? -> Item이 무엇인데)
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // MARK: - Data -> Snapshot
        // snapshot은 NSDiffableDataSourceSnapshot 타입이며, Section과 Item으로 구성되어 있음
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([.main]) // 1. 'main'이란 이름의 section을 활용할 것이다(snap!)
        snapshot.appendItems(list, toSection: .main) // 2. 무슨 데이터? list 데이터를 -> main section에 넣을 것이다!
        dataSource.apply(snapshot) // 3. 결과적으로, dataSource는 apply()하는데, 위에서 snapshot해둔 'snapshot)을 가져올거야!
        
        
        // MARK: - Layout -> Compositional Layout
        collectionView.collectionViewLayout = layout() // collectionView의 ViewLayout은 layout() 메서드를 할당받는다!
        
    }
    
    // Compositional Layout을 설정해 주기 위한 Layout 메서드 -> UICollectionViewCompositioanLayout을 반환함
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16) // section의 Padding값을 설정함
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
