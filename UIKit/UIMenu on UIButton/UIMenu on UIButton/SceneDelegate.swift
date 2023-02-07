//
//  SceneDelegate.swift
//  UIMenu on UIButton
//
//  Created by 최지우 on 2023/02/05.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        let navigationController = UINavigationController(rootViewController: UIMenuViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

    }
}
