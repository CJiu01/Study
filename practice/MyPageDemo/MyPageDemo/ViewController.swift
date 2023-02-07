//
//  ViewController.swift
//  MyPageDemo
//
//  Created by 최지우 on 2023/02/07.
//

import UIKit
import SnapKit

private let cellID = "Cell"

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        configureUI()
        
    }
    
    
    // MARK: -Helpers
    func configureUI() {
        
        view.addSubview(tableView)
        tableView.register(MyPageCell.self, forCellReuseIdentifier: cellID)
        
        setConstrains()
    }
    
    func setConstrains(){
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    
    // 몇 개 할꺼냐
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyPageCell
        
        return cell
    }
    
      
}

extension ViewController: UITableViewDelegate {
    
}
