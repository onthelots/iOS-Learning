//
//  PaywallViewController.swift
//  SpotifyPaywall
//
//  Created by joonwon lee on 2022/04/30.
//

import UIKit

class PaywallViewController: UIViewController {

    let bannerInfo: [BannerInfo] = BannerInfo.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 배경색도 같이 선언해주기
    let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    enum Section {
        case main
    }
    
    typealias Item = BannerInfo
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    @IBOutlet weak var getTappedButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presentations: diffable dataSorce
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            cell.configure(item)
            cell.backgroundColor = self.colors[indexPath.item] // cell의 배경색 indexing
            return cell
        })
        
        // data: Snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfo, toSection: .main)
        dataSource.apply(snapshot)
        
        // layout: compositioanl layout
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false // 세로 스크롤 잠금
        
        // pageControl 세팅
        pageControl.currentPage = 0
        pageControl.numberOfPages = bannerInfo.count
    }
    
    func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(156))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        // MARK: - Section이 잘릴 때, horizontal이 강제로 vertical이 되는 경우를 해소하는 방법
        // groupPagingCentered로 수정자를 선언하면, 가운데로 위치하게 됨
        section.orthogonalScrollingBehavior = .groupPagingCentered
//        section.interGroupSpacing = 20
        
        // MARK: - visibleItemsInvalidationHandler
        // 레이아웃이 변경사항이 있을 때 마다, 속성을 확인할 수 있는 일종의 Handler
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
//            print(">>> item: \(item), offset: \(offset), env: \(env)")
            
            // offset.x(groupPagingCentered로 인해 0부터 시작하지 않음)과
            // container의 너비 사이즈를 나누게 되면? -> 얼추, Index로 활용할 수 있는 숫자가 나옴
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            print(">>> \(index)")
            
            // 별도의 extension을 만들지 않고도 여기서 선언이 가능함
            self.pageControl.currentPage = index
        }
    
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

// MARK: - pageControl Setting
//extension PaywallViewController: UIScrollViewDelegate {
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("STOP")
//        
//        let index = Int(scrollView.contentOffset.x / collectionView.bounds.width)
//        
//        print("index : \(index)")
//        
//        pageControl.currentPage = index
//    }
//}
