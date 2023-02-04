//
//  ViewController.swift
//  Test_SSUThing
//
//  Created by 최지우 on 2023/01/25.
//

import UIKit
import SnapKit

class LoginController : UIViewController {
    
    
    var loginLabel : UILabel = {
        let label = UILabel()
        label.text = "로그인"
        label.textColor = UIColor.customColor(.sgray)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emailImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.fill")
        return img
    }()
    
    var emailTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "이메일 아이디", attributes: [NSAttributedString.Key.foregroundColor : UIColor.customColor(.sgray)])
        return tf
    }()
    
    private lazy var pwImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "lock.fill")
        return img
    }()
    
    var pwTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.customColor(.sgray)])
        return tf
    }()
    
    private lazy var underlineView: UIView = {
        let ulView = UIView()
        ulView.backgroundColor = UIColor.customColor(.sgray)
        return ulView
    }()
    
    //stakView

    lazy var emailStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailImage, emailTextField])
        stackView.axis = .horizontal
        stackView.backgroundColor = .orange
        return stackView
    }()
    
    lazy var pwStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwImage, pwTextField])
        stackView.axis = .horizontal
        stackView.backgroundColor = .purple
        return stackView
    }()
    
    let findPwLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호를 잊어버리셨나요?"
        label.textColor = UIColor.customColor(.green)
        return label
    }()
    
    lazy var AllStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailStackView, pwStackView, findPwLabel])
        stackView.axis = .vertical
        
        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    private lazy var loginButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.green)
        btn.setTitle("로그인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
//    private lazy var nameStackView: UIStackView = {
//           let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
//           stackView.axis = .vertical
//           stackView.alignment = .leading
//   //        stackView.backgroundColor = .brown
//           return stackView
//       }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstraints()
    }

    func setViewHierarchy(){
        view.addSubview(loginLabel)
        view.addSubview(emailImage)
        view.addSubview(AllStackView)
        view.addSubview(loginButton)
    }
    
    func setConstraints(){
        loginLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(154)
            make.trailing.equalToSuperview().offset(-154)
            make.top.equalToSuperview().offset(222)
            make.centerX.equalToSuperview()
     
        }
        
//        emailImage.snp.makeConstraints { make in
//            make.top.equalTo(loginLabel.snp.bottom).offset(62)
//            make.trailing.equalTo(loginLabel.snp.leading).offset(-87)
//        }
        
        AllStackView.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(AllStackView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(42)
            make.trailing.equalToSuperview().offset(-42)
        }
        
    }
    
    


}

