//
//  RegisterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 최지우 on 2023/01/23.
//

import UIKit


class RegisterViewController: UIViewController {
    @IBOutlet weak var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 상단 네이게이션 바 부분 히든 처리
        self.navigationController?.isNavigationBarHidden = true
    }
 
    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        print("RegisterViewController - onLoginViewControllerBtnClicked() called / 로그인 버튼 클릭")
        // 네비게이션 뷰 컨트롤러를 팝 한다.
        self.navigationController?.popViewController(animated: true)
    }
    
}
