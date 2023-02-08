//
//  SecondSectionHeader.swift
//  AdvancedMyPageView
//
//  Created by 최지우 on 2023/02/08.
//

import UIKit
import SnapKit

class SecondSectionHeader: UIView {

    // MARK : - Properties
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "설정"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
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
        addSubview(lineView)
        addSubview(titleLabel)
    }

    func setConstrains(){
        lineView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(1)
            make.top.equalToSuperview().offset(-10)
        }
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
//            make.top.equalTo(lineView.snp.bottom).offset(23)
            make.centerY.equalToSuperview()
        }
        
    }
}
