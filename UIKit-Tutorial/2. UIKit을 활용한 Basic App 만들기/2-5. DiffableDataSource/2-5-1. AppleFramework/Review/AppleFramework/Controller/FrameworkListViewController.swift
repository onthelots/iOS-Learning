//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Model 데이터 지역변수 선언
    let dataList: [AppleFramework] = AppleFramework.list
    
    // MARK: - DataSource에 들어갈 Item 타입 typealias를 통해 미리 선언
    typealias Items = AppleFramework
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Items>! // dataSource는 Diffable타입이며, Section, Item 배열 형태일거야

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        // MARK: - 새로운 방식으로 작성하는 Data, Presentation, Layout
        // 각각 누가 담당하나?
        
        // MARK: - Presentation -> diffable DataSource (데이터를 어디서, 어떻게 보여줄껀데? -> Item이 무엇인데)
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            
//            let data = dataList[indexPath.item] // 이런식으로 데이터의 index값을 가져오지 않아도 됨! (Index로 접근하는 것이 아닌, Data 자체의 Hash Value를 활용하기 때문)
            
            cell.configure(item) // for문에 속해있으므로, item을 가져와서 configure 메서드에 넣어주면 됨
            return cell
        })
        
        // MARK: - Data -> Snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Items>() // 이제 Data의 현재 snapshot(상태)을 찍는건데, 빈 배열로 찍어오고
        snapshot.appendSections([.main]) // Section은 위에서 선언했던 main
        snapshot.appendItems(dataList) // 실질적인 데이터는 전역변수에서 가져온 dataList를 가져오는거지
        
        // 기존 같았으면, cell의 갯수 (dataList.count)에 직접 접근하여 가져왔을 텐데, 이제는 snapshot을 통해 변경사항을 지켜보는 방식으로 채택한거지
        
        dataSource.apply(snapshot) // 마무리로, dataSource에 위에서 선언, 데이터 값을 snapshot 했으므로 apply() 시켜줌으로서 데이터 연결은 마무리 됨

        // MARK: - Layout -> Compositional Layout
        collectionView.collectionViewLayout = layout() // layout() 메서드를 만들어 주는데..
    }
    // 반환 타입으로는 UICollectionView'Compositional'Layout!
    func layout() -> UICollectionViewCompositionalLayout {
        
        // layout, section, group, item 순의 내림차순으로 만들어 주자
        // 사이즈를 결정하는 클래스는 NSCollcetionLayoutSize로 동일하며, 내부에서 Width와 Height를 결정할 수 있음)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalWidth(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize) // item 사이즈 결정완료
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2) // group의 형태, 사이즈, 내부에 포함될 데이터(item), 갯수 작성이 필요함
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
