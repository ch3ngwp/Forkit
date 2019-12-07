//
//  TextFieldWithTitleView.swift
//  Forkit
//
//  Created by 笨蛋 on 12/4/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class TextFieldWithTitleView: BasicView {
    let title_label:UILabel={
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setTitle(title:String){
        title_label.text = title
    }
    
    let textFiled:UITextField={
        let txt = UITextField()
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 1
        txt.autocapitalizationType = .none
        txt.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        txt.leftViewMode = .always
        txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(title_label)
        title_label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title_label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title_label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        title_label.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        addSubview(textFiled)
        textFiled.topAnchor.constraint(equalTo: title_label.bottomAnchor).isActive = true
        textFiled.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textFiled.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        textFiled.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
