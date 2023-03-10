//
//  windowScene.swift
//  tableViewwithInsertandDelete
//
//  Created by 최지우 on 2023/02/09.
//

import UIKit

func changeStatusBarBgColor(bgColor: UIColor?) {
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.first
        let statusBarManager = window?.windowScene?.statusBarManager
        
        let statusBarView = UIView(frame: statusBarManager?.statusBarFrame ?? .zero)
        statusBarView.backgroundColor = bgColor
        
        window?.addSubview(statusBarView)
    } else {
        let statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
        statusBarView?.backgroundColor = bgColor
    }
}
