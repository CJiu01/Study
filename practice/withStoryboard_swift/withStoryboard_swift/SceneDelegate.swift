//
//  SceneDelegate.swift
//  withStoryboard_swift
//
//  Created by 최지우 on 2023/01/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let mainViewController = ViewController()
        let navigationContoller = UINavigationController(rootViewController: mainViewController)
            
        window?.rootViewController = navigationContoller
        window?.makeKeyAndVisible()
    }
}
