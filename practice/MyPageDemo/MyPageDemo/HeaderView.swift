//
//  HeaderView.swift
//  MyPageDemo
//
//  Created by 최지우 on 2023/02/07.
//

import UIKit

class HeaderView: UIView {
    
    // MARK : - Properties
    
    let profileImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.fill")
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .black
        iv.layer.cornerRadius = 120/2
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK : - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : - Helpers
    
    func configureUI() {
        // UIView 이기 때문에 view.addSubview가 아닌 addSubview
        addSubview(profileImage)
    }
    
    func setConstrains() {
        profileImage.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(120)
            make.center.equalToSuperview()
        }
        
    }
}
