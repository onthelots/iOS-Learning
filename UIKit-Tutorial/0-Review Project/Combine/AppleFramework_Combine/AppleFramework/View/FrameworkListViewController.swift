//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit
import Combine

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    
    // MARK: - Combine
    // Subscriber
    var subscriptions = Set<AnyCancellable>() // 빈 구독박스
    
    // data to Publisher
    let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list) // AppleFramework타입의 퍼블리셔 (초기값은 list)
    let didSelected = PassthroughSubject<AppleFramework, Never>()
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        configureCollectionView()
    }
    // data(applySectionItems)를 처리하는 snapshot -> 직접 sink(구독화) 시킴 (데이터의 일치) -> 빈 구독티켓에 데이터를 할당함
    private func bind() {
        items
            .receive(on: RunLoop.main)
            .sink { items in
                self.applySectionItems(items)
            }.store(in: &subscriptions)
        
        // 103번줄 코드에 따라 이미 didSelected는 값을 가지고 있음)
        didSelected
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
                
                // !!! 여기가 중요 DetailController에서 선언된 초기값이 없는 framework(퍼블리셔)의 값을 어디서 할당해줘야 할까 했을때..
                // 여기, vc.framework(퍼블리셔)가 직접 데이터가 있는 framework 값을 방출함
                vc.framework.send(framework) // 따라서, 여기서 활용되는 인자값인 framework 또한 값(item.value[indexPath.item])을 가지고 있으므로 할당이 가능해짐
                self.present(vc, animated: true)
            }.store(in: &subscriptions)
    }
    
    // Combine -> data
    private func applySectionItems(_ items: [Item], to section: Section = .main) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    // Combine -> Presentation, layer
    private func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // layer
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 10
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.33))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemLayout, count:   3)
        groupLayout.interItemSpacing = .fixed(spacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = spacing
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = items.value[indexPath.item] // 퍼블리셔로 변경되었으니, 여기도 동일하게 변경함
        print(">>> selected: \(framework.name)")
        didSelected.send(framework) // 여기서, didSelected 퍼블리셔에 값을 이미 할당해줌 (퍼블리셔 Items의 값 중, indexPath로)
    }
}


// MARK: - 퍼블리셔를 -> 다른 퍼블리셔로 전송할 때
// 특정 Scope 내부의 인자값으로 변환되어 있는 형태가 아닌 이상, 'value' 값으로 전달을 해야 함
// 52번, 104번줄의 경우 내부에서 이미 변환되었거나 인자 형태로 남아 있기 때문에 이미 퍼블리셔 그 자체가 아니라고 볼 수 있음 (따라서 문제가 없음)
// 다만, DeatilViewController의 60번째 줄에서는 퍼블리셔 그 자체를 send 하는 경우이기 때문에, .value 수정자를 함께 붙여줘야 함
