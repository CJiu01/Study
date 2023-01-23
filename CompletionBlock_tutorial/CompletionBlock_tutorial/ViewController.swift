//
//  ViewController.swift
//  CompletionBlock_tutorial
//
//  Created by 최지우 on 2023/01/23.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController - viewDidLoad() 호출됨")
        
        KRProgressHUD.show()
        sayHi(completion: { result in
            print("컴플레션 블락으로 넘겨받았음: \(result)")
            KRProgressHUD.showSuccess()
            
            self.mainTitle.text = result
        })
    }
    
    
    
    fileprivate func sayHi(completion: @escaping(String) -> ()) {
        
        print("ViewController - sayHi() 호출됨")

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            print("하이")
            completion("하이")

        }
    }


}

