//
//  SceneDelegate.swift
//  weak_self_example
//
//  Created by Jae hyuk Yim on 2023/09/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        let rootViewController = StartViewController() // rootViewController 설정

        // rootNavigationController 설정
        let rootNavigationController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.largeTitleDisplayMode = .never

        window.rootViewController = rootNavigationController
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

