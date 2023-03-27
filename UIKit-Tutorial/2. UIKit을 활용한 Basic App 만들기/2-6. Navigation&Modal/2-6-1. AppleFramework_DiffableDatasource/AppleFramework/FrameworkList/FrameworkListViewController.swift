//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    let list: [AppleFramework] = AppleFramework.list
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        
        // layer
        collectionView.collectionViewLayout = layout()
        
        // MARK: - collectionView 위임자 -> Item 별 modal(Detail)을 띄우기 위해
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

// MARK: - Item을 클릭할 시, 새로운 Modality 창을 띄우기 위해 Delegate extension을 선언
extension FrameworkListViewController: UICollectionViewDelegate {
    
    // didSelectedItemAt은 indexPath로 받아왔으니..
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
        
        // MARK: - Modality로 띄울 FrameworkDetailViewController의 정보를 가져옴
        
        // 1. storyboard
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        
        // 2. ViewController (해당 storyboard를 담당하는 ViewController의 정보) -> InstantiateViwController의 Identifier는?
        // 타입 캐스팅은 as! 강제로 (데이터가 있으니 상관없음)
        let vc = storyboard.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
        
        // MARK: - framework 데이터 업데이트
        vc.framework = framework
        
        // MARK: - Modal 창의 layout을 설정 (.automatic or fullScreen)
//        vc.modalPresentationStyle = .fullScreen
        // 3. 'present' 메서드를 활용, 해당 storyboard에 해당하는 vc를 불러옴
        present(vc, animated: true)
    }
}
