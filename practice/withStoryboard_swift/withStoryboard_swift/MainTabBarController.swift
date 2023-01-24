//
//  MainTabBarController.swift
//  withStoryboard_swift
//
//  Created by 최지우 on 2023/01/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MainTabBarController - viewDidLoad() called")
        
        let firstNC = UINavigationController.init(rootViewController: MyViewController(title: "첫번째", bgColor: .purple))
        let secondNC = UINavigationController.init(rootViewController: MyViewController(title: "두번째", bgColor: .yellow))
        let thirdNC = UINavigationController.init(rootViewController: MyViewController(title: "세번째", bgColor: .red))
        let fourthNC = UINavigationController.init(rootViewController: MyViewController(title: "네번째", bgColor: .green))
        let fifthNC = UINavigationController.init(rootViewController: MyViewController(title: "다섯번째", bgColor: .lightGray))
        
        self.viewControllers = [firstNC, secondNC, thirdNC, fourthNC, fifthNC]
        
        let firstTabBarItem = UITabBarItem(title: "첫번째", image: UIImage(systemName: "airplayaudio"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "두번째", image: UIImage(systemName: "airplayvideo"), tag: 1)
        let thirdTabBarItem = UITabBarItem(title: "세번째", image: UIImage(systemName: "arrow.down.left.video.fill"), tag: 2)
        let fourthTabBarItem = UITabBarItem(title: "네번째", image: UIImage(systemName: "arrow.clockwise.icloud.fill"), tag: 3)
        let fifthTabBarItem = UITabBarItem(title: "다섯번째", image: UIImage(systemName: "safari.fill"), tag: 4)
        
        firstNC.tabBarItem = firstTabBarItem
        secondNC.tabBarItem = secondTabBarItem
        thirdNC.tabBarItem = thirdTabBarItem
        fourthNC.tabBarItem = fourthTabBarItem
        fifthNC.tabBarItem = fifthTabBarItem

    }
}
