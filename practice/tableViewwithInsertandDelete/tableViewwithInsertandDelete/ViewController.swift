//
//  ViewController.swift
//  tableViewwithInsertandDelete
//
//  Created by 최지우 on 2023/02/09.
//

import UIKit
import SnapKit

private let cellID = "videoCell"

class ViewController: UIViewController {
    
    // MARK : - Properties
    let tableView = UITableView()
    var videos : [String] = ["Facebook Interview 3", "iOS Podcasts", "UIButton Animations"]
    
    let addVideoTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        textField.placeholder = "Enter Video Name"
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00).cgColor
        return textField
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 25
        
        button.addTarget(ViewController.self, action: #selector(addButtonTapped), for: .touchUpInside)
       
        return button
    }()
    
    
    // MARK : - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.topItem?.title = "My Videos"
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)

        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           changeStatusBarBgColor(bgColor: UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00))
       }
    
    
    
    // MARK : - Helpers
    

    func configureUI() {
        
        // Register cell
        tableView.register(VideoCell.self, forCellReuseIdentifier: cellID)
        
        // extension 위임
        tableView.dataSource = self
        tableView.delegate = self
        

        
        // section 사이의 footer 제거
        tableView.tableFooterView = UIView(frame: CGRect.zero)

        setViewHierarchy()
        setConstraints()
        
//        tableView.backgroundColor = .orange
        
    }
    
    func setViewHierarchy() {
        view.addSubview(addVideoTextField)
        view.addSubview(addButton)
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        addVideoTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.height.equalTo(50)
            make.width.equalTo(230)
            make.leading.equalToSuperview().offset(30)
        }
        addButton.snp.makeConstraints { make in
            make.leading.equalTo(addVideoTextField.snp.trailing).offset(20)
            make.top.equalTo(addVideoTextField)
            make.height.equalTo(50)
            make.width.equalTo(80)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(addVideoTextField.snp.bottom).offset(30)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
    }
    
    @objc func addButtonTapped() {
        insertNewVideoTitle()
    }
    
    func insertNewVideoTitle() {
        
        videos.append(addVideoTextField.text!)
        
        let indexPath = IndexPath(row: videos.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        addVideoTextField.text = ""
        view.endEditing(true)
         
        
    }

    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! VideoCell
        
        cell.textLabel?.text = videos[indexPath.row]
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    
    
}

extension ViewController : UITableViewDelegate {
    
    // cell 한 칸 size
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}




// MARK: - PreView
import SwiftUI

#if DEBUG
struct PreView: PreviewProvider {
    static var previews: some View {
        ViewController()
            .toPreview()
    }
}
#endif
