//
//  ViewController.swift
//  UIAction
//
//  Created by 최지우 on 2023/02/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {


    private var btn : UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTab), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }()
    
    private var newbtn : UIButton = {
        let button = UIButton(type: .custom, primaryAction: UIAction(handler: { _ in print("new Button Tab")}))
        button.setTitle("new Button", for: .normal)
        button.backgroundColor = .lightGray
        return button
    }()
    
    
                             
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let action = UIAction { _ in print("Zedd") }

        // 1.
        let button = UIButton(type: .custom, primaryAction: action)

        // 2.
        let button2 = UIButton(type: .custom)
        button2.addAction(action, for: .touchUpInside)
        
        setViewHierarchy()
        setConstraints()
        
    }
    
    func setViewHierarchy(){
        view.addSubview(btn)
        view.addSubview(newbtn)
    }
    
    func setConstraints(){
        btn.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
        }
        newbtn.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(btn.snp.bottom).offset(10)
        }
    }
        
    @objc
    func buttonDidTab() {
        print("ButtonDidTab")
    }
    

}

