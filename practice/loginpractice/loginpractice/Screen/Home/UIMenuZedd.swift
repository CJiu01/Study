//
//  UIMenuZedd.swift
//  loginpractice
//
//  Created by 최지우 on 2023/02/06.
//

import UIKit
import SnapKit

class UIMenuZedd : UIViewController {
    
    
    let menu : UIMenu = {
//        btn.showsMenuAsPrimaryAction = true
        
        let favorite = UIAction(title: "즐겨찾기", image: UIImage(systemName: "heart"), handler: { _ in print("즐겨찾기") })
        let cancel = UIAction(title: "취소", attributes: .destructive, handler: { _ in print("취소") })
        let cjw = UIAction(title: "CJW",
                            image: UIImage(systemName: "moon.zzz"),
                            handler: { _ in print("CJW")})
        let submenu = UIMenu(title: "메뉴입니다",
                             identifier: nil,
                             options: .destructive,
                             children: [cjw])
        
        let btn = UIMenu(title: "title 입니다",
                          image: UIImage(systemName: "heart.fill"),
                          identifier: nil,
                          options: .displayInline,
                          children: [favorite,cancel,submenu])
                          
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
      
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "",
                                                                 image: UIImage(systemName: "ellipsis.circle"),
                                                                 primaryAction: nil,
                                                                 menu: menu)
//        setViewHierarchy()
//        setConstrains()
    }
    
//    func setViewHierarchy(){
//        view.addSubview(button)
//
//    }
//
//    func setConstrains(){
//        button.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.height.equalTo(50)
//        }
//    }
}
