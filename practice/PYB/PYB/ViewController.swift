//
//  ViewController.swift
//  PYB
//
//  Created by 최지우 on 2023/01/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var myBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("버튼임", for: .normal)
        btn.backgroundColor = UIColor.purple
        btn.addTarget(self, action: #selector(btnEvent), for: .touchUpInside)
        return btn  
    }()
    
    var myLabel : UILabel = {
        let label = UILabel()
        label.text = "텍스트임"
        label.font = UIFont.systemFont(ofSize: 25)
        label.backgroundColor = .green
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy(){
        view.addSubview(myBtn)
        view.addSubview(myLabel)
    
    
    func setConstraints(){
        myBtn.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        myLabel.snp.makeConstraints { make in
            make.top.equalTo(myBtn.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            
        }
    }
    
    @objc func btnEvent(){
        myBtn.backgroundColor = .yellow
    }
}

