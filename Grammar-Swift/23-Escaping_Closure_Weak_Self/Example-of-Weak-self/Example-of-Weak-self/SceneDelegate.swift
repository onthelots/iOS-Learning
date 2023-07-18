//
//  SceneDelegate.swift
//  Example-of-Weak-self
//
//  Created by Jae hyuk Yim on 2023/07/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
       
        // 첫 번째 화면이 될 VC
        let firstViewController = MainViewController()
        
        // 기본 네비게이션 컨트롤러 (+ 첫 화면 VC)
        let navigationController = UINavigationController(rootViewController: firstViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        // window rootView -> navigationController
        window.rootViewController = navigationController
        
        // info에서 Storyboard를 삭제했으므로, 아래 메서드를 실행해야 함
        window.makeKeyAndVisible()
             
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}

