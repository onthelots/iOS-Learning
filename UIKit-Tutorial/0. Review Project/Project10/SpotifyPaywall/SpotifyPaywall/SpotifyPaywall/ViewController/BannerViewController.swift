//
//  BannerViewController.swift
//  SpotifyPaywall
//
//  Created by Jae hyuk Yim on 2023/03/29.
//

import UIKit

class BannerViewController: UIViewController {
    
    // Model struct
    var bannerInfo: [BannerInfo] = BannerInfo.list
    
    // Components
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // DiffableDataSource
    enum Section {
        case main
    }
    typealias Item = BannerInfo
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // data -> NSDiffableDataSourceSnapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfo, toSection: .main)
        dataSource.apply(snapshot)
        
        // Layout -> CompositioanlLayout
        collectionView.collectionViewLayout = layout()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = false
        
        // PageControl setting
        pageControl.currentPage = 0
        pageControl.numberOfPages = bannerInfo.count
        
    }
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(142))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        section.interGroupSpacing = 10 // padding
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // MARK: - visibleItemInvalidationHandler
        // layout이 변할때마다 속성을 확인할 수 있는 Handler
        
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
            let index = Int(offset.x / (env.container.contentSize.width).rounded(.up))
            print(">>>\(index)")
            
            self.pageControl.currentPage = index
        }
        
        return layout
    }
}
