//
//  FirstSectionHeader.swift
//  AdvancedMyPageView
//
//  Created by 최지우 on 2023/02/08.
//

import UIKit
import SnapKit

class FirstSectionHeader: UIView {
    
    // MARK : - Properties
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "기본 정보"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    
    
    // MARK : - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .lightGray
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        setViewHierarchy()
        setConstrains()
        
    }

    func setViewHierarchy(){
        addSubview(titleLabel)
    }

    func setConstrains(){
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
//            make.top.equalTo(TopHeader.snp.bottom).offset(8)
            make.centerY.equalToSuperview()

        }
    
}
    
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
