//
//  ViewController.swift
//  loginpractice
//
//  Created by 최지우 on 2023/01/26.
//

import UIKit
import SnapKit

class LoginController: UIViewController {
    
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
        img.tintColor = UIColor.customColor(.sgray)
        return img
    }()
    
    var emailTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "이메일 아이디", attributes: [NSAttributedString.Key.foregroundColor : UIColor.customColor(.sgray)])
        
        //textField.font = UIFont(name: textField.font!.fontName, size: 14)
        tf.font = UIFont(name: tf.font!.fontName  ,size: 14)
        tf.keyboardType = .asciiCapable
        
        tf.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 25, width: 257, height: 1)
        border.backgroundColor = UIColor.customColor(.bgray).cgColor
        tf.layer.addSublayer((border))
        tf.textColor = UIColor.black
        return tf
    }()
    
    private lazy var pwImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "lock.fill")
        img.tintColor = UIColor.customColor(.sgray)

        return img
    }()
    
    var pwTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.customColor(.sgray)])
        tf.font = UIFont(name: tf.font!.fontName  ,size: 14)
        tf.isSecureTextEntry = true

        tf.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 25, width: 257, height: 1)
        border.backgroundColor = UIColor.customColor(.bgray).cgColor
        tf.layer.addSublayer((border))
        tf.textColor = UIColor.black
        
        return tf
    }()
    
    var pwFindLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호를 잊어버리셨나요?"
        label.textColor = UIColor.customColor(.green)
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    var loginBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.backgroundColor = UIColor.customColor(.green)
        btn.setTitleColor(.white, for: .normal)
        btn.contentHorizontalAlignment = .center
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(touchNextBtnEvent), for: .touchUpInside)
//        btn.titleLabel?.textAlignment = .center
       
        return btn
    }()
    
    var googleLoginBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("구글 계정으로 로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.backgroundColor = UIColor.customColor(.bgray)
        btn.setTitleColor(UIColor.customColor(.darkGray), for: .normal)
        btn.contentHorizontalAlignment = .center
        btn.layer.cornerRadius = 5
//        btn.titleLabel?.textAlignment = .center
       
        return btn
    }()
    
    //선 그리기
    private lazy var lineView: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.customColor(.bgray)
           return view
       }()

    
    //StackView
    lazy var emailStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailImage, emailTextField])
        stackView.axis = .horizontal
//        stackView.backgroundColor = .orange
        stackView.spacing = 17.69
        stackView.alignment = .leading
        return stackView
    }()

    lazy var pwStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwImage, pwTextField])
        stackView.axis = .horizontal
//        stackView.backgroundColor = .green
        stackView.spacing = 17.69
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var TextStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailStackView, pwStackView])
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstrains()
    }
    
    func setViewHierarchy(){
        view.addSubview(loginLabel)
        view.addSubview(TextStackView)
        view.addSubview(pwFindLabel)
        view.addSubview(loginBtn)
        view.addSubview(googleLoginBtn)
    }
    
    func setConstrains(){
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(222)
            make.leading.equalToSuperview().offset(154)
            make.trailing.equalToSuperview().offset(-154)
        }
        emailImage.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.width.equalTo(22)
        }
//        emailTextField.snp.makeConstraints { make in
//            make.height.equalTo(30)
//        }
        pwImage.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.width.equalTo(22)
        }
        
        TextStackView.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(62)
            make.leading.equalToSuperview().offset(49)
            make.trailing.equalToSuperview().offset(-34)

        }
        pwFindLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-42)
            make.top.equalTo(pwStackView.snp.bottom).offset(9)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(pwFindLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(42)
            make.trailing.equalToSuperview().offset(-42)
            make.width.equalTo(291)
            make.height.equalTo(41)
            
        }
        
        googleLoginBtn.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(107)
            make.leading.equalToSuperview().offset(42)
            make.trailing.equalToSuperview().offset(-42)
            make.width.equalTo(291)
            make.height.equalTo(41)
        }
    }

//    @objc func touchNextBtnEvent() {
//        if((emailTextField.text != "") && (pwTextField.text != "")) {
//            let nextVC = TabBarController()
//            navigationController?.pushViewController(nextVC, animated: true)
//        }
//    }
    
    @objc func touchNextBtnEvent(){
        let nextVC = TabBarController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

}

