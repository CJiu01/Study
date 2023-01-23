//
//  ViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 최지우 on 2023/01/23.
//

import UIKit

class LoginViewController: UIViewController {

    // 뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // 상단 네비게이션 바 부분을 히든 처리한다
        self.navigationController?.isNavigationBarHidden = true
    }


}

