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
    
    let list: [AppleFramework] = AppleFramework.list
    
    // Combine
    var subscriptions = Set<AnyCancellable>() // 빈 구독박스 생성
    let didSelected = PassthroughSubject<AppleFramework, Never>() // 배출자 생성
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CollcetionView -> Presentation, Layout의 설정
        // CollcetionView -> Data 가져오기
        
        configureCollectionView()
        bind()
    }
    
    // MARK: - bind 함수
    private func bind() {
        // input: 사용자의 데이터를 받아서, 처리
        // - 특정 Item이 선택되었을 때 처리방식
        didSelected
            .receive(on: RunLoop.main)
            .sink { framework in
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
            vc.framework = framework
            
            present(vc, animated: true)
        }.store(in: &subscriptions)
        // output : data, state 상태 변경에 따라 UI를 업데이트
        // - 특정 Item들이 UI적으로 세팅이 되어있을 때, CollectionView를 업데이트
    }
    
    
    private func applySectionItems(_ items: [Item], to section: Section = .main) {
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    private func configureCollectionView() {
        // presentation
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
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
        
        // Publisher의 데이터를 send -> 어떤걸로? 'framework' (list 내부의 item)
        didSelected.send(framework)
    }
}
