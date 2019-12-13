//
//  StoreInfoView.swift
//  Forkit
//
//  Created by 笨蛋 on 11/16/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class StoreInfoView: BasicView {
    
    var storeData:Store?{
        didSet{
            store_name.text = storeData?.name
            desc_label.text = storeData?.desc
//            address_label.text = 
        }
    }
    
    let store_name:UILabel={
        let label = UILabel()
        label.text = "Panda Express"
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let address_label:UILabel={
        let label = UILabel()
        label.text = "2213 Tasman Dr Santa Clara, CA 95054"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let desc_label:UILabel={
        let label = UILabel()
        label.text = "Back by popular demand, Honey Sesame Chicken Breast is available at Panda Express…"
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.black.withAlphaComponent(0.8)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(store_name)
        store_name.topAnchor.constraint(equalTo: self.topAnchor,constant:8).isActive = true
        store_name.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        store_name.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        store_name.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        
        addSubview(address_label)
        address_label.topAnchor.constraint(equalTo: store_name.bottomAnchor,constant:8).isActive = true
        address_label.leftAnchor.constraint(equalTo: store_name.leftAnchor).isActive = true
        address_label.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/2).isActive = true
        address_label.heightAnchor.constraint(greaterThanOrEqualToConstant: 48).isActive = true
        
        addSubview(desc_label)
        desc_label.topAnchor.constraint(equalTo: address_label.bottomAnchor,constant:16).isActive = true
        desc_label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        desc_label.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        desc_label.heightAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
