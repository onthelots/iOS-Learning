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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // MARK: - View의 데이터 업데이트
        // 뷰가 나타나기 전에, selectedViewController의 데이터를 업데이트 해줄 수 있음! (처음 빌드했을 때, navigationItem이 한번에 보이지 않는 문제를 해소함)
        updateNavigationItem(vc: self.selectedViewController!)
    }
    
    // MARK: - ViewController별로 navigationItem(UIBarButtonItem)을 Update 하는 메서드
    private func updateNavigationItem(vc: UIViewController) {
        switch vc {
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
            navigationItem.backButtonDisplayMode = .minimal // backButton의 모드 설정 (.miniaml일 경우, 아이콘으로만 설정됨)

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
            navigationItem.backButtonDisplayMode = .minimal
            
        case is NearLocationViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "내 근처",
                handler: { })
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = []
            navigationItem.backButtonDisplayMode = .minimal
            
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
            navigationItem.backButtonDisplayMode = .minimal
            
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
            navigationItem.backButtonDisplayMode = .minimal
        
        default:
            let titleConfig = CustomBarItemConfiguration(
                title: "당근당근",
                handler: { })
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            navigationItem.leftBarButtonItem = titleItem // 할당
            navigationItem.rightBarButtonItems = []
            navigationItem.backButtonDisplayMode = .minimal
        }
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("---> Selected Tabbar: vc: \(viewController)")
        
        // updateNavigationItem 메서드의 매개변수로, 선택되는(didSelected) ViewController를 할당
        updateNavigationItem(vc: viewController)
    }
}
