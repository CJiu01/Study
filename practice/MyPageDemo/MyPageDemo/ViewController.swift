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
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    let myPageMenu = ["내 정보 수정", "공지사항", "피드백", "기타"]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.backgroundColor = .yellow
        
        configureUI()
        
    }
    
    
    // MARK: -Helpers
    func configureUI() {
        
        view.addSubview(tableView)

        
        // Extension 적용
        tableView.delegate = self
        tableView.dataSource = self
        
        // cell 적용
        tableView.register(MyPageCell.self, forCellReuseIdentifier: cellID)
        
        setConstrains()
    }
    
    func setConstrains(){
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//          make.top.bottom.leading.trailing.equalToSuperview()
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    
    // 몇 개 할꺼냐
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyPageCell
        
//        cell.backgroundColor = .red
        
        // Set Label
        cell.menuLabel.text = myPageMenu[indexPath.row]
        // cell 우측에 > 기호 추가
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView()
        
//        header.backgroundColor = .yellow
        
        return header
    }
    
    // header의 크기를 지정해주어야 함.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160
    }
    
    // cell을 select와 동시에 didselect 하는 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
