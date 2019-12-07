//
//  ProfileViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 12/4/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
import ImagePicker
class ProfileViewController: UIViewController,ImagePickerDelegate {
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        self.icon_iamge.image = images[0]
        self.dismiss(animated: false, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        self.dismiss(animated: false, completion: nil)
    }
    
    var user:[String]?{
        didSet{
            first_name_text_field.textFiled.text = user?[1]
            last_name_text_field.textFiled.text = user?[2]
            phone_text_field.textFiled.text = user?[3]
            email_text_field.textFiled.text = user?[4]
        }
    }
    let navigation:MyNavigator={
        let navi = MyNavigator()
        navi.title.text = "Setting"
        return navi
    }()
    
    let arrow_image:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "left_arrow")
        img.setImageColor(color: UIColor.white)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var back_button:UIButton={
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Back", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        return btn
    }()
    
    @objc func back(){
        self.dismiss(animated: false, completion: nil)
    }
    
    
    lazy var save_button:UIButton={
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Save", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.contentHorizontalAlignment = .right
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(save), for: .touchUpInside)
        return btn
    }()
    
    @objc func save(){
        var userArr:[String] = []
        userArr.append("jJack0812")
        userArr.append(first_name_text_field.textFiled.text ?? "")
        userArr.append(last_name_text_field.textFiled.text ?? "")
        userArr.append(phone_text_field.textFiled.text ?? "")
        userArr.append(email_text_field.textFiled.text ?? "")
        
//        let data = uiimagepn
        let imageData = self.icon_iamge.image!.pngData()
        UserDefaults.standard.set(imageData, forKey: "user_image")
        UserDefaults.standard.set(userArr, forKey: "user")
        self.dismiss(animated: true, completion: nil)
    }
    
    let icon_iamge:UIImageView={
        let img = UIImageView()
        img.clipsToBounds = true
        img.image = UIImage(named: "dish")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let icon_button:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleSelectImage), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSelectImage(){
        let imagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    let first_name_text_field:TextFieldWithTitleView={
        let txt = TextFieldWithTitleView()
        txt.setTitle(title: "First Name")
        return txt
    }()
    
    let last_name_text_field:TextFieldWithTitleView={
        let txt = TextFieldWithTitleView()
        txt.setTitle(title: "Last Name")
        return txt
    }()
    
    let phone_text_field:TextFieldWithTitleView={
        let txt = TextFieldWithTitleView()
        txt.setTitle(title: "Phone Number")
        return txt
    }()
    
    let email_text_field:TextFieldWithTitleView={
        let txt = TextFieldWithTitleView()
        txt.setTitle(title: "E-mail")
        return txt
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initNavigation()
        
        initView()
        // Do any additional setup after loading the view.
    }
    
    
    
    func initNavigation(){
        view.addSubview(navigation)
        navigation.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigation.heightAnchor.constraint(equalToConstant: isPhoneX ? 88 : 64).isActive = true
        navigation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigation.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        navigation.left_view.addSubview(arrow_image)
        arrow_image.leftAnchor.constraint(equalTo: navigation.left_view.leftAnchor).isActive = true
        arrow_image.centerYAnchor.constraint(equalTo: navigation.left_view.centerYAnchor).isActive = true
        arrow_image.heightAnchor.constraint(equalTo: navigation.left_view.heightAnchor,constant:-16).isActive = true
        arrow_image.widthAnchor.constraint(equalTo: navigation.left_view.heightAnchor,constant:-16).isActive = true
        
        navigation.left_view.addSubview(back_button)
        back_button.centerYAnchor.constraint(equalTo: arrow_image.centerYAnchor).isActive = true
        back_button.heightAnchor.constraint(equalTo: arrow_image.heightAnchor).isActive = true
        back_button.leftAnchor.constraint(equalTo: arrow_image.rightAnchor).isActive = true
        back_button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        navigation.right_view.addSubview(save_button)
        save_button.centerYAnchor.constraint(equalTo: navigation.right_view.centerYAnchor).isActive = true
        save_button.heightAnchor.constraint(equalTo: navigation.right_view.heightAnchor).isActive = true
        save_button.rightAnchor.constraint(equalTo: navigation.right_view.rightAnchor).isActive = true
        save_button.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func initView(){
        
        view.addSubview(icon_iamge)
        icon_iamge.topAnchor.constraint(equalTo: navigation.bottomAnchor,constant:32).isActive = true
        icon_iamge.leftAnchor.constraint(equalTo: view.leftAnchor,constant:16).isActive = true
//        icon_iamge.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        icon_iamge.heightAnchor.constraint(equalToConstant: 96).isActive = true
        icon_iamge.widthAnchor.constraint(equalToConstant: 96).isActive = true
        
        
        view.addSubview(icon_button)
        icon_button.topAnchor.constraint(equalTo: navigation.bottomAnchor,constant:32).isActive = true
        icon_button.leftAnchor.constraint(equalTo: view.leftAnchor,constant:16).isActive = true
        //        icon_iamge.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        icon_button.heightAnchor.constraint(equalToConstant: 96).isActive = true
        icon_button.widthAnchor.constraint(equalToConstant: 96).isActive = true
        
        view.addSubview(first_name_text_field)
        first_name_text_field.topAnchor.constraint(equalTo: icon_iamge.bottomAnchor,constant:32).isActive = true
        first_name_text_field.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        first_name_text_field.heightAnchor.constraint(equalToConstant: 56).isActive = true
        first_name_text_field.widthAnchor.constraint(equalTo: view.widthAnchor,constant:-32).isActive = true
        
        view.addSubview(last_name_text_field)
        last_name_text_field.topAnchor.constraint(equalTo: first_name_text_field.bottomAnchor,constant:16).isActive = true
        last_name_text_field.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        last_name_text_field.heightAnchor.constraint(equalToConstant: 56).isActive = true
        last_name_text_field.widthAnchor.constraint(equalTo: view.widthAnchor,constant:-32).isActive = true
        
        
        view.addSubview(phone_text_field)
        phone_text_field.topAnchor.constraint(equalTo: last_name_text_field.bottomAnchor,constant:16).isActive = true
        phone_text_field.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phone_text_field.heightAnchor.constraint(equalToConstant: 56).isActive = true
        phone_text_field.widthAnchor.constraint(equalTo: view.widthAnchor,constant:-32).isActive = true
        
        view.addSubview(email_text_field)
        email_text_field.topAnchor.constraint(equalTo: phone_text_field.bottomAnchor,constant:16).isActive = true
        email_text_field.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        email_text_field.heightAnchor.constraint(equalToConstant: 56).isActive = true
        email_text_field.widthAnchor.constraint(equalTo: view.widthAnchor,constant:-32).isActive = true
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
