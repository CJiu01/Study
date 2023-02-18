//
//  SelectOption.swift
//  HalfModalPresentation
//
//  Created by 최지우 on 2023/02/17.
//

import FSCalendar
import UIKit
import SnapKit

class SelectOptionViewController : UIViewController {
    
    let patrolLabel : UILabel = {
        let label = UILabel()
        label.text = "경관봉"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var selectDateBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("날짜 선택                                                           >", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.96, alpha: 1.00)
//        btn.contentHorizontalAlignment = .center
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(touchSelectDateBtnEvent), for: .touchUpInside)
        btn.contentHorizontalAlignment = .left
//        btn.titleLabel?.textAlignment = .right
//        btn.contentEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
          btn.titleEdgeInsets.left = 25; // add left padding.
//        button.titleEdgeInsets.right = 10; // add right padding.
//        button.titleEdgeInsets.top = 10; // add top padding.
//        button.titleEdgeInsets.bottom = 10; // add bottom padding.
       
        return btn
    }()
    
    lazy var selectCountBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("수량 선택                                                           >", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.96, alpha: 1.00)
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets.left = 25; // add left padding.
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(touchSelectCountBtnEvent), for: .touchUpInside)
//        btn.titleLabel?.textAlignment = .center
       
        return btn
    }()
    
    lazy var reservationBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("예약하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        btn.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        btn.contentHorizontalAlignment = .center
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(touchResevationBtnEvent), for: .touchUpInside)
//        btn.titleLabel?.textAlignment = .center
       
        return btn
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
//        view.backgroundColor = .systemYellow
        
        modalPresentationStyle = .pageSheet
        
        if let sheet = sheetPresentationController {
            
            //지원할 크기 지정
            sheet.detents = [.medium(), .large()]
            //크기 변하는거 감지
            sheet.delegate = self
           
            //시트 상단에 그래버 표시 (기본 값은 false)
            sheet.prefersGrabberVisible = true
            
            //처음 크기 지정 (기본 값은 가장 작은 크기)
            //sheet.selectedDetentIdentifier = .large
            
            //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        
        setViewHierarchy()
        setConstrains()
    }
    
    func setViewHierarchy(){
        view.addSubview(patrolLabel)
        view.addSubview(selectDateBtn)
        view.addSubview(selectCountBtn)
        view.addSubview(reservationBtn)
    }
    
    func setConstrains(){
        patrolLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(161)
            make.top.equalToSuperview().offset(40)
        }
        selectDateBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalTo(patrolLabel.snp.bottom).offset(16)
            make.height.equalTo(50)
        }
        selectCountBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalTo(selectDateBtn.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        reservationBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalTo(selectCountBtn.snp.bottom).offset(80)
            make.height.equalTo(60)
        }

    }
    
    @objc func touchSelectDateBtnEvent(){
        let vc = CalendarViewController()
                vc.view.backgroundColor = .systemBackground
                
                vc.modalPresentationStyle = .pageSheet
                
                if let sheet = vc.sheetPresentationController {
                    
                    //지원할 크기 지정
                    sheet.detents = [.medium(), .large()]
                    //크기 변하는거 감지
                    sheet.delegate = self
                   
                    //시트 상단에 그래버 표시 (기본 값은 false)
                    sheet.prefersGrabberVisible = true
                    
                    //처음 크기 지정 (기본 값은 가장 작은 크기)
                    //sheet.selectedDetentIdentifier = .large
                    
                    //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
                    //sheet.largestUndimmedDetentIdentifier = .medium
                }
                
                present(vc, animated: true, completion: nil)
        
    }
    
    @objc func touchSelectCountBtnEvent(){
        let vc = ObjectCountViewController()
                vc.view.backgroundColor = .systemBackground
                
                vc.modalPresentationStyle = .pageSheet
                
                if let sheet = vc.sheetPresentationController {
                    
                    //지원할 크기 지정
                    sheet.detents = [.medium(), .large()]
                    //크기 변하는거 감지
                    sheet.delegate = self
                   
                    //시트 상단에 그래버 표시 (기본 값은 false)
                    sheet.prefersGrabberVisible = true
                    
                    //처음 크기 지정 (기본 값은 가장 작은 크기)
                    //sheet.selectedDetentIdentifier = .large
                    
                    //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
                    //sheet.largestUndimmedDetentIdentifier = .medium
                }
                
                present(vc, animated: true, completion: nil)

        
    }
    
    @objc func touchResevationBtnEvent() {
        print("reservation")

    }
    
}

extension SelectOptionViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        //크기 변경 됐을 경우
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}
