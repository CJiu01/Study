//
//  AlertPopUpViewController.swift
//  Protocol Delegate Pattern
//
//  Created by 최지우 on 2023/02/20.
//

import UIKit
import SnapKit


class EmployeeController : UIViewController {
    
    var taskDelegate:TaskDelegate!
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Am doing what you asked"
        return lb
    }()
    
    let btn: UIButton = {
        let bt = UIButton()
        bt.setTitle("Send task", for: .normal)
        bt.backgroundColor = .red
        bt.layer.cornerRadius = 25
        bt.addTarget(self, action: #selector(handleBtn), for: .touchUpInside)
        return bt
    }()
    
    @objc
    func handleBtn() {
        guard let text = nameLabel.text, !text.isEmpty else { return }
        
        taskDelegate.addTask(task: text)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        view.addSubview(nameLabel)
        view.addSubview(btn)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        nameLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(50)
        }
        
        btn.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(30)
            
        }
    }
}
