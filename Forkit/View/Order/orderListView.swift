//
//  orderListView.swift
//  Forkit
//
//  Created by 笨蛋 on 10/11/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class orderCell:UITableViewCell{
    weak var delegate:orderViewDelegate?
    var orderData:Order?{
        didSet{
            
        }
    }
    let img:UIImageView={
        let img = UIImageView()
        img.layer.cornerRadius = 4
        img.clipsToBounds = true
        img.image = UIImage(named: "dish")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let order_number:UILabel={
        let label = UILabel()
        label.text = "Order #2345993"
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Pick-up: 09/21 13:00 PM"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let status:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "New"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    let price:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.text = "$12.99"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var detail:UIButton={
//        let yourAttributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: 16),
//            .foregroundColor: UIColor.black,
//            .underlineStyle: NSUnderlineStyle.single.rawValue]
//
//        let btn = UIButton(type: .system)
//        let attributeString = NSMutableAttributedString(string: "Order Detail",
//                                                        attributes: yourAttributes)
//        btn.setAttributedTitle(attributeString, for: .normal)
//        btn.contentHorizontalAlignment = .right
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
    
    let divider:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(img)
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        img.leftAnchor.constraint(equalTo: self.leftAnchor,constant:16).isActive = true
        img.heightAnchor.constraint(equalTo: self.heightAnchor,constant:-32).isActive = true
        img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true

        addSubview(order_number)
        order_number.topAnchor.constraint(equalTo: img.topAnchor).isActive = true
        order_number.leftAnchor.constraint(equalTo: img.rightAnchor,constant:16).isActive = true
        order_number.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/2).isActive = true
        order_number.heightAnchor.constraint(equalTo: img.heightAnchor, multiplier: 1/3).isActive = true
        
        addSubview(time)
        time.topAnchor.constraint(equalTo: order_number.bottomAnchor).isActive = true
        time.leftAnchor.constraint(equalTo: order_number.leftAnchor).isActive = true
        time.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/2).isActive = true
        time.heightAnchor.constraint(equalTo: img.heightAnchor, multiplier: 1/3).isActive = true
        
        addSubview(status)
        status.topAnchor.constraint(equalTo: img.topAnchor).isActive = true
        status.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-16).isActive = true
        status.widthAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
        status.heightAnchor.constraint(equalTo: order_number.heightAnchor).isActive = true
        
        
        
//        addSubview(price)
//        price.topAnchor.constraint(equalTo: status.bottomAnchor).isActive = true
//        price.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-16).isActive = true
//        price.widthAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
//        price.heightAnchor.constraint(equalTo: time.heightAnchor).isActive = true
        
        addSubview(price)
        price.topAnchor.constraint(equalTo: time.bottomAnchor).isActive = true
        price.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-16).isActive = true
        price.widthAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
        price.heightAnchor.constraint(equalTo: img.heightAnchor, multiplier: 1/3).isActive = true
        
                addSubview(divider)
                divider.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-1).isActive = true
                divider.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                divider.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
                divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class OrderListView: BasicView,UITableViewDelegate,UITableViewDataSource  {
    weak var delegate:orderViewDelegate?
    var orderList:[Order]?{
        didSet{
            self.tableView.reloadData()
            let index = orderList?.count == 0
            tableView.isHidden = index
            message_label.isHidden = !index
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! orderCell
        cell.orderData = self.orderList?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = self.orderList?[indexPath.row].id
        self.delegate?.showOrderDetail(orderId: id ?? "")
    }
    
    lazy var tableView:UITableView={
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        table.register(orderCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let message_label:UILabel={
        let label = UILabel()
        label.text = "There is no order yet~"
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(message_label)
        message_label.topAnchor.constraint(equalTo: self.topAnchor,constant:16).isActive = true
        message_label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        message_label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        message_label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        addSubview(tableView)
        tableView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
