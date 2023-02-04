//
//  TabOneViewController.swift
//  loginpractice
//
//  Created by 최지우 on 2023/01/27.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var topBackSquare : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.maingreen)
        return view
    }()
    
    var userLabel : UILabel = {
        let label = UILabel()
        label.text = "Hi, User  \nWith SSUThing, Be Ambitious"
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Noto Sans CJK KR", size: 19)
        label.backgroundColor  = .darkGray
        return label
    }()
    
    var dDayBox : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstrains()
    }
    
    func setViewHierarchy(){
        view.addSubview(topBackSquare)
        view.addSubview(userLabel)
        view.addSubview(dDayBox)
        
    }
    
    func setConstrains(){
        
        topBackSquare.snp.makeConstraints { make in
            make.height.equalToSuperview().offset(-538)
            make.width.equalToSuperview()
        }
        
        userLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.top.equalToSuperview().offset(60)
            make.height.equalTo(57)
            make.width.equalTo(178)
        }
        
        dDayBox.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(95)
            
        }
        
    }
}
