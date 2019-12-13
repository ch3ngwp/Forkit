//
//  searchNaviView.swift
//  Forkit
//
//  Created by 笨蛋 on 12/3/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

protocol SearchDelegate:NSObjectProtocol {
    func handleSearchByName(name:String)
}
class searchNaviView: BasicView {
    weak var delegate:SearchDelegate?
    
    let search_button:UIButton={
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Search", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.addTarget(self, action: #selector(search), for: .touchUpInside)
        return btn
    }()
    
    @objc func search(){
        let name = search_filed.text
        self.delegate?.handleSearchByName(name: name ?? "")
    }
    
    
    let search_filed:UITextField={
        let tf = UITextField()
        tf.layer.cornerRadius = 24
        tf.placeholder = "Store/Food name"
        tf.backgroundColor = UIColor.white
        tf.setIcon(name: "search")
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let location_filed:UITextField={
        let tf = UITextField()
        tf.layer.cornerRadius = 24
        tf.placeholder = "Location"
        tf.backgroundColor = UIColor.white
        tf.setIcon(name: "location")
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func setupView() {
        backgroundColor = MyColor.themeColor
        translatesAutoresizingMaskIntoConstraints = false
        
        initView()
    }
    
    func initView(){
        addSubview(search_button)
        search_button.topAnchor.constraint(equalTo: self.topAnchor,constant: isPhoneX ? 44 : 20).isActive = true
        search_button.leftAnchor.constraint(equalTo: self.leftAnchor,constant:16).isActive = true
        search_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        search_button.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/4).isActive = true
        
        addSubview(search_filed)
        search_filed.topAnchor.constraint(equalTo: search_button.bottomAnchor,constant:8).isActive = true
        search_filed.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        search_filed.heightAnchor.constraint(equalToConstant: 48).isActive = true
        search_filed.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        
        addSubview(location_filed)
        location_filed.topAnchor.constraint(equalTo: search_filed.bottomAnchor,constant:8).isActive = true
        location_filed.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        location_filed.heightAnchor.constraint(equalToConstant: 48).isActive = true
        location_filed.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
