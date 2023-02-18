//
//  ObjectCountViewController.swift
//  HalfModalPresentation
//
//  Created by 최지우 on 2023/02/18.
//

import UIKit
import SnapKit

class ObjectCountViewController : UIViewController, UISheetPresentationControllerDelegate {
    
    var countOptionLabel : UILabel = {
        let label = UILabel()
        label.text = "수량 선택"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var objectName : UILabel = {
        let label = UILabel()
        label.text = "경관봉"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var customStepper: CustomStepper = {
        let blueOcean = UIColor(red: 0.97, green: 0.98, blue: 0.96, alpha: 1.00)
        let stepper = CustomStepper(viewData: .init(color: blueOcean, minimum: 0, maximum: 100, stepValue: 1))
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(didStepperValueChanged), for: .valueChanged)
        return stepper
      }()
   
    
    lazy var objectBoxStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [objectName, customStepper])
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.96, alpha: 1.00)
        stackView.spacing = 18
        
        stackView.alignment = .leading
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        view.addSubview(countOptionLabel)
        view.addSubview(objectBoxStackView)
       
    }
    
    func setConstrains(){
        countOptionLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(40)
        }
        objectName.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(15)
        }
        objectBoxStackView.snp.makeConstraints{ make in
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            make.height.equalTo(88)
            make.top.equalTo(countOptionLabel.snp.bottom).offset(16)
//            make.leadingMargin.equalTo(50)
            
        }

        
    }
    
    @objc func stepperValueChanged(_ stepper: UIStepper) {
        print("Count: \(stepper.value)")
    }
    
    @objc private func didStepperValueChanged() {
      print("latest value: \(customStepper.value)")
    }
}
