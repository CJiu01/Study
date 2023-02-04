//
//  TabTwoViewController.swift
//  loginpractice
//
//  Created by 최지우 on 2023/01/27.
//

import UIKit
import SnapKit

class SearchViewController : UIViewController {
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createDatepicker()
        setViewHierarchy()
        setConstrains()
    }
    
    func setViewHierarchy(){
        view.addSubview(datePicker)

    }
    
    func setConstrains(){
        datePicker.snp.makeConstraints { make in
            make.center.equalToSuperview().offset(50)
            
        }
    }
    
    
    func createDatepicker() -> UIToolbar {
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        return toolbar
        
    }
    
    
}
