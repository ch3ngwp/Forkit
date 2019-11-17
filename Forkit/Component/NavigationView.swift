//
//  NavigationView.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class TextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

class HomeNavigator: BasicView {
    let location:UILabel={
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "2711 N 1st St., San Jose, CA 95134"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let search:TextField={
        let tf = TextField()
        tf.backgroundColor = UIColor.white
        tf.attributedPlaceholder = NSAttributedString(string: "Search for Store/Cuisine",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.3)])
        tf.tintColor = MyColor.themeColor
        tf.layer.cornerRadius = 24
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func setupView() {
        backgroundColor = MyColor.themeColor
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(location)
        location.topAnchor.constraint(equalTo: self.topAnchor,constant:isPhoneX ? 44 : 20).isActive = true
        location.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        location.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        location.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
        addSubview(search)
        search.topAnchor.constraint(equalTo: location.bottomAnchor,constant:8).isActive = true
        search.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        search.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        search.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


class AccountNavigator:BasicView{
    
    let img:UIImageView={
        let img = UIImageView()
        img.layer.cornerRadius = 4
        img.clipsToBounds = true
        img.image = UIImage(named: "dish")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let name:UILabel={
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.text = "Jack"
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let id:UILabel={
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.text = "Jack0812"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = MyColor.themeColor
        initView()
    }
    
    func initView(){
        addSubview(img)
        img.topAnchor.constraint(equalTo: self.topAnchor,constant:isPhoneX ? 52:28).isActive = true
        img.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        img.leftAnchor.constraint(equalTo: self.leftAnchor,constant:16).isActive = true
        img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true
        
        addSubview(name)
        name.topAnchor.constraint(equalTo: img.topAnchor).isActive = true
        name.heightAnchor.constraint(equalTo: img.heightAnchor, multiplier:1/2).isActive = true
        name.leftAnchor.constraint(equalTo: img.rightAnchor,constant:16).isActive = true
        name.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:1/2).isActive = true
        
        addSubview(id)
        id.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        id.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        id.leftAnchor.constraint(equalTo: img.rightAnchor,constant:16).isActive = true
        id.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:1/2).isActive = true
    }
}

class MyNavigator:BasicView{
    let title:UILabel={
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func setupView() {
        backgroundColor = MyColor.themeColor
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(title)
        title.topAnchor.constraint(equalTo: self.topAnchor,constant:isPhoneX ? 44:20).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
