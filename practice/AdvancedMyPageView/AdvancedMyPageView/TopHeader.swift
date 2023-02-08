//
//  TopHeader.swift
//  AdvancedMyPageView
//
//  Created by 최지우 on 2023/02/08.
//

import UIKit
import SnapKit

class TopHeader: UIView {

    // MARK : - Properties
    
    let topView : UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "사람 이름"
        label.textColor = .white
        return label
    }()
    
    let typeLabel : UILabel = {
        let label = UILabel()
        label.text = "fruitarian"
        label.textColor = .white
        return label
    }()
    
    let whiteView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 20
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
    // MARK : - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .orange
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : - Heapers
    
    func configureUI() {
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy() {
        addSubview(topView)
        topView.addSubview(whiteView)
        topView.addSubview(nameLabel)
        topView.addSubview(typeLabel)
    }
    func setConstraints() {
        topView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
            make.height.equalTo(250)
            make.width.equalToSuperview()
            make.top.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(topView).offset(16)
        }
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(topView).offset(16)
         }
        whiteView.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.width.equalTo(343)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(typeLabel.snp.bottom).offset(60)
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
