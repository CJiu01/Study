//
//  TabBarController.swift
//  loginpractice
//
//  Created by 최지우 on 2023/01/27.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    
//    let homeVC = HomeViewController()
//    let searchVC = SearchViewController()
//    let noticeVC = NoticeViewController()
//    let mylistVC = MyListViewController()
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        mainTabBar()
//        
//    }
//    
//    // back button 제거
//    override func viewWillAppear(_ animated: Bool) {
//         super.viewWillAppear(animated)
//         self.navigationItem.hidesBackButton = true
//    }
//
//    
//    // 각 tabBar에 rootViewController를 지정할 경우와의 차이점 알아보기
//    func mainTabBar() {
//        
//        self.tabBar.tintColor = .white
//        self.tabBar.backgroundColor = UIColor.customColor(.maingreen)
//        self.tabBar.unselectedItemTintColor = UIColor.customColor(.bgray)
//        
//        //set tile
//        homeVC.title = "home"
//        searchVC.title = "search"
//        noticeVC.title = "notice"
//        mylistVC.title = "mylist"
//
//        // assign view controllers to tab bar
//        self.setViewControllers([homeVC,searchVC,noticeVC,mylistVC], animated : false)
//
//        
//        guard let items = self.tabBar.items else {return}
//        
//        let images = [ "house", "magnifyingglass", "exclamationmark.square", "clock.arrow.circlepath" ]
////      mylistVC.tabBarItem.image = UIImage(systemName: "clock.arrow.circlepath")
//        
//        for x in 0...3 {
//            items[x].image = UIImage (systemName: images[x])
//        }
//        
//    }
//    
}



