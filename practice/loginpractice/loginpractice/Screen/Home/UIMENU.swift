//
//  UIMENU.swift
//  loginpractice
//
//  Created by 최지우 on 2023/02/06.
//

import UIKit
import SnapKit

class UIMENU : UIViewController {
 
    
    var menuItems: [UIAction] {
        return [
            UIAction(title: "modify", image: UIImage(systemName: "pencil"), handler: { _ in  }),
            UIAction(title: "delete", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { _ in })
        ]
    }
    
    var menu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        self.title = "navigationBar"
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backTapped))
        
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "",
                                                                 image: UIImage(systemName: "ellipsis.circle"),
                                                                 primaryAction: nil,
                                                                 menu: menu)
    
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"),
//                                                                 style: .plain,
//                                                                 target: self,
//                                                                 action: #selector(moreActionTapped))
        

    }
    
   
    
   
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func moreActionTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: "select a Option", preferredStyle: .actionSheet)
     
        let deleteAction = UIAlertAction(title: "modify", style: .default, handler: { _ in })
        let saveAction = UIAlertAction(title: "delete", style: .destructive, handler: { _ in })
        let cancelAction = UIAlertAction(title: "cancle", style: .cancel, handler: { _ in })
     
        alert.addAction(deleteAction)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
     
        self.present(alert, animated: true, completion: nil)
    }
    
}

