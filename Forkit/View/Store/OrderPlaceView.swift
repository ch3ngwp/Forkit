//
//  OrderPlaceView.swift
//  Forkit
//
//  Created by 笨蛋 on 11/16/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class OrderPlaceView: BasicView {
    var item_number:Int = 0{
        didSet{
            item_label.text = "ORDER ITME: \(item_number)"
        }
    }
    var total_price:Double = 0{
        didSet{            
            price_label.text = "TOTAL PRICE: $\(total_price.roundTo2f == 0 ? 0.00 :total_price.roundTo2f)"
        }
    }
    lazy var order_button:UIButton={
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 24
        btn.setTitle("Place Order", for: .normal)
        btn.backgroundColor = MyColor.themeColor
        btn.setTitleColor(UIColor.white, for: .normal)
//        btn.addTarget(self, action: #selector(toRegister), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let item_label:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "ORDER ITME: 0"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let price_label:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "TOTAL PRICE: $0.00"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let divider:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(divider)
        divider.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        divider.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        divider.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        addSubview(order_button)
        order_button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        order_button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        order_button.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-16).isActive = true
        order_button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(item_label)
        item_label.topAnchor.constraint(equalTo: order_button.topAnchor).isActive = true
        item_label.leftAnchor.constraint(equalTo: self.leftAnchor,constant:16).isActive = true
        item_label.rightAnchor.constraint(equalTo: order_button.leftAnchor,constant:-16).isActive = true
        item_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(price_label)
        price_label.bottomAnchor.constraint(equalTo: order_button.bottomAnchor).isActive = true
        price_label.leftAnchor.constraint(equalTo: self.leftAnchor,constant:16).isActive = true
        price_label.rightAnchor.constraint(equalTo: order_button.leftAnchor,constant:-16).isActive = true
        price_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
