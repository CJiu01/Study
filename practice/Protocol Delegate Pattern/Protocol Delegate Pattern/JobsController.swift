//
//  ViewController.swift
//  Protocol Delegate Pattern
//
//  Created by 최지우 on 2023/02/20.
//

import UIKit
import SnapKit

// MARK: TaskDelegate
protocol TaskDelegate {
    func addTask(task:String)
}

// MARK: JobsController
class JobsController : UIViewController {
    
    var tasks:[String] = ["Hello World app", "Dry run the squirrel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Taska"
        view.backgroundColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(handleAddBtn))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL_ID") t
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
    Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        cell.accessoryType = .checkmark
        
        return cell
    }
    
    @objc func handleAddBtn() {
        let employController = EmployeeController()
        
        employController.taskDelegate = self
        present(employController, animated: true, completion: nil)
    }
    
}

extension JobsController:TaskDelegate {
    func addTask(task: String) {
        tasks.append(task)
        tableView.reloadData()
    }
}
