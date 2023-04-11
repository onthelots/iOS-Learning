//
//  MainTabBarViewController.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/11.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    private func updateNavigationItem(vc: UIViewController) {
        //
    }
}

// 각 탭에 맞게, 네비게이션 바 아이템(Right) 구성하기
// - 홈 : 타이틀 / 피드, 서치
// - 동네활동 : 타이틀 / 피드
// - 내 근처 : 타이틀 / X
// - 채팅 : 타이틀 / 피드
// - 나의 당근 : 타이틀 / 설정

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("---> Selected Tabbar: vc: \(viewController)")
        
        switch viewController {
        case is HomeViewController:
            
            // MARK: - titleConfig 받아오기 (초기값 설정)
            let titleConfig = CustomBarItemConfiguration(
                title: "성내동",
                handler: { })
            // extension 받아오기
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            
            // MARK: - SearchConfig 초기값 설정하기
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "magnifyingglass"),
                handler: { print("---> searchItem Selected")})
            let searchItem = UIBarButtonItem.generate(
                with: searchConfig,
                width: 30)
            
            // MARK: - SearchConfig 초기값 설정하기
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: {print("---> feedItem Selected")})
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30)

            
            // MARK: - navigationItem UIBarButtonItem 각각(좌,우) 할당
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem, searchItem] // 2개 이상일 경우, rightBarButtonItems(배열)에 할당하기

        case is MyTownViewController:
            
            let titleConfig = CustomBarItemConfiguration(
                title: "동네생활",
                handler: { })
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: {print("---> feedItem Selected")})
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            
        case is NearLocationViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "내 근처",
                handler: { })
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = []
            
        case is ChatViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "채팅",
                handler: { })
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: {print("---> feedItem Selected")})
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "나의 당근",
                handler: { })
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let settingConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "gear"),
                handler: {print("---> settingItem Selected")})
            let settingItem = UIBarButtonItem.generate(
                with: settingConfig,
                width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [settingItem]
        
        default:
            let titleConfig = CustomBarItemConfiguration(
                title: "당근당근",
                handler: { })
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            navigationItem.leftBarButtonItem = titleItem // 할당
            navigationItem.rightBarButtonItems = []
        }
    }
}
