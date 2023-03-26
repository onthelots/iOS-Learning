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
    
    @IBOutlet weak var getTappedButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pageControl 세팅
        pageControl.currentPage = 0
        pageControl.numberOfPages = bannerInfo.count
    }
}

// MARK: - pageControl Setting
extension PaywallViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("STOP")
        
        var index = Int(scrollView.contentOffset.x / collectionView.bounds.width)
        
        pageControl.numberOfPages = index
    }
}


// 과제: 아래 애플 샘플 코드 다운받아서 돌려보기  https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views
