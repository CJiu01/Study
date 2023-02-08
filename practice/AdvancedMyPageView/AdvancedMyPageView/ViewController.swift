//
//  ViewController.swift
//  AdvancedMyPageView
//
//  Created by 최지우 on 2023/02/08.
//

import UIKit
import SnapKit

private let cellID = "mypageCell"

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let tableView = UITableView()
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // register cell 
        tableView.register(MyPageCell.self, forCellReuseIdentifier: cellID)
        
        // extension 위임
        tableView.dataSource = self
        tableView.delegate = self
        
        configureUI()
        
    }
    
    
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        setViewHierarchy()
        setConstrains()
        
    }
    
    func setViewHierarchy(){
        view.addSubview(tableView)
    }
    
    func setConstrains(){
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//          make.top.bottom.leading.trailing.equalToSuperView()
        }
        
    }
    
}


extension ViewController : UITableViewDataSource{
    
    // Register number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // 캐스팅을 통해 cell 등록
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyPageCell
        
        return cell
    }
    
}


extension ViewController : UITableViewDelegate {
    
}
