//
//  OnboardingViewController.swift
//  PagingView
//
//  Created by Jae hyuk Yim on 2023/03/26.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // 데이터 선언
    let message: [OnboardingMessage] = OnboardingMessage.messages
    
    // MARK: - pageControl
    // Collection View indicator에서 Scrolling 옵션 중, 'Paging enabled' 체크
    @IBOutlet weak var pageControl: UIPageControl!
    
    // 컬렉션뷰 선언
    @IBOutlet weak var collectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Layout의 estimatedItemSize = zero
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        
        // MARK: - Data, Presentation, Layout
    
        collectionView.backgroundColor = nil // 이게 계속 안먹히네
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // MARK: - controlPage 설정
        // 점 갯수 설정
        pageControl.numberOfPages = message.count
        
        // 디폴트 위치(page) 설정
        pageControl.currentPage = 0
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return message.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        
        // 위 dequeueReusableCell은 일종의 반복문이므로, messageIndexPath의 indextPath에 따른 item(정수, Int)를 임의변수로 선언한 후
        let messageIndexPath = message[indexPath.item]
        
        // 해당 Cell 마다 데이터 정보를 넘겨주면 됨
        cell.configure(messageIndexPath)
        return cell
    }

}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}


// MARK: - ScrollView 조정을 통한 PageControl 위치 설정
extension OnboardingViewController: UIScrollViewDelegate {
    // Scroll이 멈출때 마다 'STOP' 프린트 찍기
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("STOP")
        
        // MARK: - Index 값을 설정하려고 하는데..
        // scrollView 자체의 위치값은 x좌표측 맨 첫번째 0부터 쭉 증가하게 됨
        // 따라서, 해당 값을 collectionView의 너비값으로 나누고
        // Int정수형으로 변환한 후, 해당 값을 PageControl 변수에 현재값(currentPage)업데이트 시켜줌
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        print("contentsOffset x : \(index)")
        
        pageControl.currentPage = index
    }
}
