//
//  MenuListView.swift
//  Forkit
//
//  Created by 笨蛋 on 11/16/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

protocol MenuTableDelegate:NSObjectProtocol {
    func handleOrderInformation(number:Int,price:Double)
}

class MenuCell:UITableViewCell{
    var delegate:MenuTableDelegate?
    var account:Int = 0 {
        didSet{
            let index = account != 0
            add_button.isHidden = index
            add_btn.isHidden = !index
            number_label.isHidden = !index
            minus_btn.isHidden = !index
            number_label.text = "\(account)"
        }
    }
    
    var dish:Dish?{
        didSet{
            dish_name.text = dish?.dish_name
            price.text = "$\(dish?.price ?? 0)"
            describe.text = dish?.desc
            print(dish?.imageURL)
            let image = dish?.imageURL?.count != 0 ? dish?.imageURL?[0] : "https://www.urbansplash.co.uk/images/placeholder-16-9.jpg"
            img.downloaded(from: image!)
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
    
    let dish_name:UILabel={
        let label = UILabel()
        label.text = "Panda Express"
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let price:UILabel={
        let label = UILabel()
        label.text = "$12.99"
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let material:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.text = "Checken, Rice, Carrots…"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let describe:UILabel={
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor.black
        label.text = "This is a demo description"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var add_button:UIButton={
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 4
        btn.setTitle("Add", for: .normal)
        btn.tintColor = UIColor.white
        btn.backgroundColor = MyColor.themeColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleAdd(){
        account += 1
        self.delegate?.handleOrderInformation(number: 1, price: dish?.price ?? 0)
    }
    
    lazy var add_btn:UIButton={
        let btn = UIButton(type: .system)
        btn.isHidden = true
        btn.layer.cornerRadius = 12
        btn.setTitle("+", for: .normal)
        btn.tintColor = UIColor.white
        btn.backgroundColor = MyColor.themeColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        return btn
    }()
    
    let number_label:UILabel={
        let label = UILabel()
        label.isHidden = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var minus_btn:UIButton={
        let btn = UIButton(type: .system)
        btn.isHidden = true
        btn.layer.cornerRadius = 12
        btn.setTitle("-", for: .normal)
        btn.tintColor = UIColor.white
        btn.backgroundColor = MyColor.themeColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleMinus), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleMinus(){
        account -= 1
        self.delegate?.handleOrderInformation(number: -1, price: dish?.price ?? 0)
    }
    
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
        img.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -16).isActive = true
        img.leftAnchor.constraint(equalTo: self.leftAnchor,constant:16).isActive = true
        img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true
        
        addSubview(price)
        price.topAnchor.constraint(equalTo: img.topAnchor).isActive = true
        price.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-8).isActive = true
        price.widthAnchor.constraint(lessThanOrEqualToConstant: 96).isActive = true
        price.heightAnchor.constraint(lessThanOrEqualToConstant: 24).isActive = true
        
        
        addSubview(dish_name)
        dish_name.topAnchor.constraint(equalTo: img.topAnchor).isActive = true
        dish_name.leftAnchor.constraint(equalTo: img.rightAnchor,constant:8).isActive = true
        dish_name.rightAnchor.constraint(equalTo: price.leftAnchor,constant:-8).isActive = true
        dish_name.heightAnchor.constraint(lessThanOrEqualToConstant: 24).isActive = true
        
       
        addSubview(material)
        material.topAnchor.constraint(equalTo: dish_name.bottomAnchor).isActive = true
        material.leftAnchor.constraint(equalTo: dish_name.leftAnchor).isActive = true
        material.widthAnchor.constraint(equalTo: dish_name.widthAnchor).isActive = true
        material.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
        
        addSubview(describe)
        describe.topAnchor.constraint(equalTo: material.bottomAnchor,constant:8).isActive = true
        describe.leftAnchor.constraint(equalTo: material.leftAnchor).isActive = true
        describe.widthAnchor.constraint(equalTo: dish_name.widthAnchor).isActive = true
        describe.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
        
        addSubview(add_button)
        add_button.bottomAnchor.constraint(equalTo: img.bottomAnchor).isActive = true
        add_button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        add_button.widthAnchor.constraint(equalToConstant: 56).isActive = true
        add_button.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-8).isActive = true
        
        addSubview(minus_btn)
        minus_btn.bottomAnchor.constraint(equalTo: img.bottomAnchor).isActive = true
        minus_btn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        minus_btn.widthAnchor.constraint(equalToConstant: 24).isActive = true
        minus_btn.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-8).isActive = true
        
        addSubview(number_label)
        number_label.centerYAnchor.constraint(equalTo: minus_btn.centerYAnchor).isActive = true
        number_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        number_label.widthAnchor.constraint(greaterThanOrEqualToConstant: 8).isActive = true
        number_label.rightAnchor.constraint(equalTo: minus_btn.leftAnchor,constant:-8).isActive = true
        
        addSubview(add_btn)
        add_btn.centerYAnchor.constraint(equalTo: minus_btn.centerYAnchor).isActive = true
        add_btn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        add_btn.widthAnchor.constraint(equalToConstant: 24).isActive = true
        add_btn.rightAnchor.constraint(equalTo: number_label.leftAnchor,constant:-8).isActive = true
        //        addSubview(divider)
        //        divider.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-1).isActive = true
        //        divider.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //        divider.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        //        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuListView: BasicView,UITableViewDelegate,UITableViewDataSource {
    var delegate:MenuTableDelegate?
    var dishList:[Dish]?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dishList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.dish = self.dishList?[indexPath.row]
        cell.delegate = self.delegate
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.delegate?.storeList(storeSelect: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor.white
        let title = UILabel(frame: CGRect(x: 16, y: 8, width: tableView.frame.width-32, height: 32))
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        title.text = "MENU"
        view.addSubview(title)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y<0){
            scrollView.contentOffset.y = 0
        }
    }
    
    lazy var tableView:UITableView={
        let table = UITableView(frame: .zero)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        table.register(MenuCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
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
