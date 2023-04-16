//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/11.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel = HomeViewModel(network: NetworkService(configuration: .default))
    var subscription = Set<AnyCancellable>()
    
    enum Section {
        case main
    }
    typealias Item = ItemInfo
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch() // ViewModel에서 선언한 fetch 함수를 실행
        bind()
        configuration()
    }
    
    // dataSource, data, layout, delegate
    private func configuration() {
        // Presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeListCell", for: indexPath) as? HomeListCell else {
                return nil
            }
            cell.configure(item: item)
            return cell
        })
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems([], toSection: .main)
        self.dataSource.apply(snapshot)
        
        // layout
        collectionView.collectionViewLayout = layout()
        
        // delegate
        collectionView.delegate = self
    }
    
    //
    private func applyItem (_ item: [ItemInfo]) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(item, toSection: .main)
        self.dataSource.apply(snapshot)
    }
    
    // layout
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        return UICollectionViewCompositionalLayout(section: section)
    }

    private func bind() {
        
        // Input - item 가져오기
        viewModel.$items
            .receive(on: RunLoop.main)
            .sink { items in
                self.applyItem(items)
            }.store(in: &subscription)
        
        // Output - 사용자 인터렉션 실행하기
        viewModel.itemTapped
            .sink { item in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscription)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // viewModel.item(빈 배열)-> indexPath의 아이템 값
        let items = viewModel.items[indexPath.item]
        print("--- didSelected Item: \(items)")
        viewModel.itemTapped.send(items)
        
    }
}
