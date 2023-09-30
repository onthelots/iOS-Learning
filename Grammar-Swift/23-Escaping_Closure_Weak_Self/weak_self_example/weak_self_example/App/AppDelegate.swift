//
//  AppDelegate.swift
//  weak_self_example
//
//  Created by Jae hyuk Yim on 2023/09/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let rootViewController = StartViewController() // rootViewController 설정

        // rootNavigationController 설정
        let rootNavigationController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.largeTitleDisplayMode = .never

        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        //
    }
}

