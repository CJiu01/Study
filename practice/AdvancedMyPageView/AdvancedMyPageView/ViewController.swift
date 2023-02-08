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
    let firstMenuArray = ["프로필 수정", "앱 버전 1.0.0", "공지사항", "브릿지에 대해서"]
    let secondMenuArray = ["로그아웃", "회원탈퇴"]
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureUI()
        
    }
    
    // viewWillAppear 시, navigationBar = Hidden
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        // register cell
        tableView.register(MyPageCell.self, forCellReuseIdentifier: cellID)
        
        // extension 위임
        tableView.dataSource = self
        tableView.delegate = self
        
//        tableView.backgroundColor = .orange
        tableView.tableFooterView = UIView()
        
        // TopHeader
        tableView.tableHeaderView = TopHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        
        // safeArea Zone에 content = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        // cell line 제거
        tableView.separatorStyle = .none
        
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

// cell에서 어떻게 보여줄 지 지정하는 프로토콜
extension ViewController : UITableViewDataSource{
    
    // Set Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    // Register number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return firstMenuArray.count
        } else {
            return secondMenuArray.count
        }
    }
      
    // 캐스팅을 통해 cell 등록
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyPageCell
        
        // memu Array 넣어주기
        if indexPath.section == 0 {
            cell.textLabel?.text = firstMenuArray[indexPath.row]
        } else {
            cell.textLabel?.text = secondMenuArray[indexPath.row]
        }
        return cell
    }
    
    // Set Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let header = FirstSectionHeader()
            return header
        } else {
            let header = SecondSectionHeader()
            return header
        }
    }
    
}

// 테이블 뷰에서 cell이 눌러졌을 때 실행할 프로토콜
extension ViewController : UITableViewDelegate {
    
    // cell 한 칸의 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    // TopHeader size
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//     did Select cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Section
        if indexPath.section == 0 {
            
            // Section[0]의 row
            switch indexPath.row {
            case 0:
                let controller = AmendProfileViewController()
                navigationController?.pushViewController(controller, animated: true)
            case 1:
                print("\(firstMenuArray[indexPath.row])")
            case 2:
                print("\(firstMenuArray[indexPath.row])")
            default :
                print("\(firstMenuArray[indexPath.row])")
            }
            
        }else {
            switch indexPath.row {
            case 0:
                print("\(secondMenuArray[indexPath.row])")
            default:
                print("\(secondMenuArray[indexPath.row])")

            }
        }

    }
     
}
