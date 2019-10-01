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
        location.topAnchor.constraint(equalTo: self.topAnchor,constant:40).isActive = true
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
