//
//  AppDelegate.swift
//  Example-of-Weak-self
//
//  Created by Jae hyuk Yim on 2023/07/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        // 첫 번째 화면이 될 VC
        let firstViewController = MainViewController()
        
        // 기본 네비게이션 컨트롤러 (+ 첫 화면 VC)
        let navigationController = UINavigationController(rootViewController: firstViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        // window rootView -> navigationController
        window.rootViewController = navigationController
        
        // info에서 Storyboard를 삭제했으므로, 아래 메서드를 실행해야 함
        window.makeKeyAndVisible()
             
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

