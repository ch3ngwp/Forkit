//
//  RegisterView.swift
//  Forkit
//
//  Created by 笨蛋 on 11/16/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class RegisterView: BasicView {
    weak var delegate:LoginViewDelegate?
    let account_text_filed:MyTextField={
        let tf = MyTextField()
        tf.layer.cornerRadius = 4
        tf.placeholder = "Account/E-mail"
        tf.backgroundColor = UIColor.white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let pwd_text_filed:MyTextField={
        let tf = MyTextField()
        tf.layer.cornerRadius = 4
        tf.placeholder = "Password"
        tf.backgroundColor = UIColor.white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let confirm_text_filed:MyTextField={
        let tf = MyTextField()
        tf.layer.cornerRadius = 4
        tf.placeholder = "Confirm Password"
        tf.backgroundColor = UIColor.white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var register_button:UIButton={
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 4
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium )
        btn.setTitle("REGISTER", for: .normal)
        btn.setTitleColor(MyColor.themeColor, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.addTarget(self, action: #selector(register), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    @objc func register(){
        
    }
    
    lazy var login_button:UIButton={
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(toLogin), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func toLogin(){
        self.delegate?.loginViewIndex(index: 0)
    }
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(account_text_filed)
        account_text_filed.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        account_text_filed.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        account_text_filed.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        account_text_filed.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        addSubview(pwd_text_filed)
        pwd_text_filed.topAnchor.constraint(equalTo: account_text_filed.bottomAnchor,constant:16).isActive = true
        pwd_text_filed.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pwd_text_filed.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        pwd_text_filed.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        addSubview(confirm_text_filed)
        confirm_text_filed.topAnchor.constraint(equalTo: pwd_text_filed.bottomAnchor,constant:16).isActive = true
        confirm_text_filed.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        confirm_text_filed.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        confirm_text_filed.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        addSubview(register_button)
        register_button.topAnchor.constraint(equalTo: confirm_text_filed.bottomAnchor,constant:16).isActive = true
        register_button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        register_button.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        register_button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        addSubview(login_button)
        login_button.topAnchor.constraint(equalTo: register_button.bottomAnchor,constant:8).isActive = true
        login_button.leftAnchor.constraint(equalTo: register_button.leftAnchor).isActive = true
        login_button.widthAnchor.constraint(equalTo: register_button.widthAnchor,multiplier:1/2).isActive = true
        login_button.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
