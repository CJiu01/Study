//
//  ViewController.swift
//  HalfModalPresentation
//
//  Created by 최지우 on 2023/02/17.
//

import UIKit


class ViewController: UIViewController {
    
    let presentButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.frame = .init(x: 100, y: 100, width: 100, height: 100)
        btn.setTitle("presentModal", for: .normal)
        btn.addTarget(self, action: #selector(presentModalBtnTap), for: .touchUpInside)
        return btn
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViewHierarchy()
        setConstrains()
    }
    
    func setViewHierarchy(){
        view.addSubview(presentButton)
    }
    
    func setConstrains(){
        
    }
    
    @objc private func presentModalBtnTap() {
        
        let vc = SelectOptionViewController()
//        vc.view.backgroundColor = .systemYellow
//
//        vc.modalPresentationStyle = .pageSheet
//
//        if let sheet = vc.sheetPresentationController {
//
//            //지원할 크기 지정
//            sheet.detents = [.medium(), .large()]
//            //크기 변하는거 감지
//            sheet.delegate = self
//
//            //시트 상단에 그래버 표시 (기본 값은 false)
//            sheet.prefersGrabberVisible = true
//
//            //처음 크기 지정 (기본 값은 가장 작은 크기)
//            //sheet.selectedDetentIdentifier = .large
//
//            //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
//            sheet.largestUndimmedDetentIdentifier = .medium
//        }
        
        present(vc, animated: true, completion: nil)
    }
    
}

extension ViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        //크기 변경 됐을 경우
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}
