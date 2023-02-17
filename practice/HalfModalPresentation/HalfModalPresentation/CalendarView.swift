//
//  CalendarView.swift
//  HalfModalPresentation
//
//  Created by 최지우 on 2023/02/17.
//

import UIKit
import SnapKit
import FSCalendar

class CalendarView : UIViewController, FSCalendarDelegate, UISheetPresentationControllerDelegate {
    
    var calendar = FSCalendar()

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
        
        calendar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.frame = CGRect(x: 0,
                                y: 0,
                                width: view.frame.size.width,
                                height: view.frame.size.width)
        view.addSubview(calendar)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print("\(string)")
    }
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.commonInit()
//    }
//
//    private func commonInit(){
//        self.backgroundColor = .blue
//        self.addSubview(calendar)
//
//        constraintCustomView()
//    }
//
//    func constraintCustomView() {
//        calendar.snp.makeConstraints{ make in
//            make.height.equalToSuperview()
//            make.width.equalToSuperview()
//        }
//    }
    
}



    
    
