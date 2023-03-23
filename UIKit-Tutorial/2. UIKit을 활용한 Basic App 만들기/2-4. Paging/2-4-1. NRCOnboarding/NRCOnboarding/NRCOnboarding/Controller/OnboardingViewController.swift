//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by Jae hyuk Yim on 2023/03/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Page Control 선언
    @IBOutlet weak var pageControl: UIPageControl!
    
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = nil // collcetionView의 배경색이 없어지질 않아서, 코드로 작성
        collectionView.showsHorizontalScrollIndicator = false // indicator 삭제
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        
        // MARK: - Page Control 수정
        pageControl.numberOfPages = messages.count // pages의 갯수
        pageControl.currentPage = 0 // Index 값에 따라 점(.)의 현재값
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        let messages = messages[indexPath.item]
        cell.configure(messages)
        
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    // MARK: - 각각의 Cell간의 간격 조정
    // LineSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    // InteritemSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

// MARK: - Paging View의 상황을 파악하기 위해 Delegate 선언
extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("멈춤")
        
        // MARK: - scroll의 위치값을 index 지역변수로 저장
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        
        // MARK: - pageControl 프로퍼티의 값을 업데이트
        // 디폴트 값으로 0을 설정해 놨으니, index값이 바뀔때 (1,2) 자동으로
        // 업데이트를 시켜줌
        pageControl.currentPage = index
    }
}
