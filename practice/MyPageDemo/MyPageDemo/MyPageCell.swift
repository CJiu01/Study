//
//  MyPageCellTableViewCell.swift
//  MyPageDemo
//
//  Created by 최지우 on 2023/02/07.
//

import UIKit

class MyPageCell: UITableViewCell {
    
    // MARK : - Properties
    
    let menuLabel = UILabel()
    
    
    
    // MARK : - Lifecycle
    
    // 아래의 initializer는 viewDidLoad의 역할을 한다.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK : - Helpers
    
    func configureUI() {
        addSubview(menuLabel)
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            menuLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            menuLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12)
//        ])
//
        setConstrains()
    }
    
    
    func setConstrains() {
        menuLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
    }

}
