//
//  LoginViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
import Moya
import Result
class LoginViewController: UIViewController,LoginViewDelegate {
    
    func login() {
        let account = self.loginView.account_text_filed.text
        let password = self.loginView.pwd_text_filed.text
        
        if account != "test"{
            alert(message: "User not found!")
            return
        }else if password != "test1"{
            alert(message: "Password does not match!")
            return
        }
        
        let provider:MoyaProvider<LoginRequest> = MoyaProvider<LoginRequest>()
        provider.request(.UserLogin(account: account ?? "", password: password ?? "")){result in
            switch(result){
            case let .success(moyaResponse):
                do{
                    let responseJSON = try JSONSerialization.jsonObject(with: moyaResponse.data, options: []) as! NSArray
                    
                    if responseJSON.count != 0{
                        let user = responseJSON[0] as! NSDictionary
                        let userId = user["ID"] as? String
                        let vc = TabbarViewController()
                        UserDefaults.standard.set(true, forKey: "Auth")
                        UserDefaults.standard.set(userId, forKey: "user_id")
                        self.present(vc, animated: false, completion: nil)
                    }
//                    let json = NSString(data: moyaResponse.data, encoding: String.Encoding.utf8.rawValue)
//                    print(responseJSON)
                } catch let parsingError {
                    print("Error", parsingError)
                }
            case let .failure(error):
                print(error)
            }
        }

        
    }
    

    
    let title_label:UILabel={
        let label = UILabel()
        label.text = "Forkit"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48, weight: UIFont.Weight.heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var loginView:LoginView={
        let view = LoginView()
        view.delegate = self
        return view
    }()
    
    lazy var registerView:RegisterView={
        let view = RegisterView()
        view.delegate = self
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        let isAuth = UserDefaults.standard.bool(forKey: "Auth")
        if(isAuth){
            let vc = TabbarViewController()
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = MyColor.themeColor
        // Do any additional setup after loading the view.
        
        initView()
        
    }
    

    var LeftAnchor:NSLayoutConstraint?
    func initView(){
        view.addSubview(loginView)
        LeftAnchor = loginView.leftAnchor.constraint(equalTo: view.leftAnchor)
        LeftAnchor!.isActive = true
//        loginView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        view.addSubview(registerView)
        registerView.leftAnchor.constraint(equalTo: loginView.rightAnchor).isActive = true
        registerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        registerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        registerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(title_label)
        title_label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        title_label.bottomAnchor.constraint(equalTo: loginView.topAnchor,constant:-16).isActive = true
        title_label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        title_label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        title_label.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
    func loginViewIndex(index:Int){
        let X = -UIScreen.main.bounds.width * CGFloat(index)
        LeftAnchor?.constant = X
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func alert(message:String){
        let alert = UIAlertController(title: "", message:message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default, handler: {[unowned self] (_) in
            self.dismiss(animated: false, completion: nil)
        })
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func test(){
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
