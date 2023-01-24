//
//  ViewController.swift
//  withStoryboard_swift
//
//  Created by 최지우 on 2023/01/23.
//

import UIKit

class MyViewController: UIViewController {
    
    
    // 여기서 self는 MyViewController를 의미
    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "뷰컨트롤러 No 스토리보드"
        self.view.backgroundColor = .orange
    }


}

