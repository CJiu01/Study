//
//  ViewController.swift
//  PageViewDemo
//
//  Created by 최지우 on 2023/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK : - Properties
    
    lazy var viewPager: ViewPager = {
        let viewPager = ViewPager(tabSizeConfiguration: .fillEqually(height: 60, spacing: 0))
        
        
        let view1 = UIView()
        view1.backgroundColor = .red
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let view3 = UIView()
        view3.backgroundColor = .orange
        
        viewPager.tabbedView.tabs = [
            AppTabItemView(title: "First"),
            AppTabItemView(title: "Second"),
            AppTabItemView(title: "Third")
        ]
        
        viewPager.pagedView.pages = [
            view1, view2, view3]
        
        viewPager.translatesAutoresizingMaskIntoConstraints = false
        return viewPager
    }()
    
    // MARK : - Liftcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        
        self.view.addSubview(viewPager)
        NSLayoutConstraint.activate([
            viewPager.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            viewPager.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7),
            viewPager.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            viewPager.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title  = "ViewPager"
        
        self.navigationController?.navigationBar.standardAppearance.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}
