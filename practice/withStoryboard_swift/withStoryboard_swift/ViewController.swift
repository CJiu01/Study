//
//  ViewController.swift
//  withStoryboard_swift
//
//  Created by 최지우 on 2023/01/23.
//


import UIKit
import SnapKit

class ViewController : UIViewController {
    
//    rightBarButtonItem _ UIMenu
    
     lazy var menuItems: [UIAction] = {
        return [
            UIAction(title: "실시간 공지 사항", image: UIImage(systemName: "bell"),handler: {_ in self.touchNoticeBtnEvent()})
        ]
    }()

     lazy var menu : UIMenu = {

        let menu = UIMenu(title: "title",
                          image: UIImage(systemName: "bell"),
                          identifier: nil,
                          options: .displayInline,
                          children: menuItems)
       return menu
    }()
    
    // WelcomeLabel
    private let UserWelcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "김동현님\nSSUThing에 오신걸 환영해요!"
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont(name: "Noto Sans", size: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var categoryItemView = CategoryItemView()
    
    lazy var myRentalList = MyRentalList()
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationItem.hidesBackButton = true
//
////        self.tabBarController?.navigationItem.title = "Profile Settings"
//
//        navigationController?.navigationBar.tintColor = .black
////        navigationController?.navigationBar.topItem?.title = "zedd"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "",
//                                                            image: UIImage(systemName: "ellipsis.circle"),
//                                                            primaryAction: nil,
//                                                            menu: menu)
//    }


  
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.customColor(.mainbackgroundcolor)

//        setNavigationBar()
//        setNavigationController()

//        self.navigationItem.title = "디-데이"
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            .foregroundColor: UIColor.white,
//            .font: UIFont.systemFont(ofSize: 30, weight: .bold)] // Size를 28 이하로 변경

        configureUI()
        setButtonEvent()

    
    }

    private func setNavigationController() {

        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = "zedd"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "",
                                                            image: UIImage(systemName: "ellipsis.circle"),
                                                            primaryAction: nil,
                                                            menu: menu)
        self.navigationItem.hidesBackButton = true

    }

    private func configureUI() {
        setViewHierarchy()
        setConstrains()
        

    }
    
    func setViewHierarchy(){
        view.addSubview(UserWelcomeLabel)
        view.addSubview(categoryItemView)
        view.addSubview(myRentalList)
    }
    
    func setConstrains(){
        
        UserWelcomeLabel.snp.makeConstraints { make in
//            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.top.equalTo(110)
            make.leading.equalToSuperview().offset(25)
        }
        
        categoryItemView.snp.makeConstraints { make in
            make.top.equalTo(UserWelcomeLabel.snp.bottom).offset(26)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)

        }
        
        myRentalList.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-290)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)

        }
      
    }
    
    func setButtonEvent(){
        categoryItemView.patrolButton.addTarget(self, action: #selector(touchPatrolBtnEvent), for: .touchUpInside)
    }
    
    @objc
    func touchNoticeBtnEvent() {
        let noticeVC = RealTimeNoticeController()
        navigationController?.pushViewController(noticeVC, animated: true)
    }
    @objc
    func touchPatrolBtnEvent(){
        let nextVC = RealTimeNoticeController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
