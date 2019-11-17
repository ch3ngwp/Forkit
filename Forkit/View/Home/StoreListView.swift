//
//  StoreListView.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
protocol storeTableDelegate:NSObjectProtocol {
    func storeList( storeSelect index:Int)
}
class StoreCell:UITableViewCell{
    
    let img:UIImageView={
        let img = UIImageView()
        img.layer.cornerRadius = 4
        img.clipsToBounds = true
        img.image = UIImage(named: "dish")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let store_name:UILabel={
        let label = UILabel()
        label.text = "Panda Express"
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let type:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Asian Food"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let miles:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "9 miles"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let describe:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "This is a demo description"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let close_time:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Closed"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let divider:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(img)
        img.topAnchor.constraint(equalTo: self.topAnchor,constant:8).isActive = true
        img.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        img.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        img.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(store_name)
        store_name.topAnchor.constraint(equalTo: img.bottomAnchor,constant:8).isActive = true
        store_name.leftAnchor.constraint(equalTo: img.leftAnchor).isActive = true
        store_name.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/2).isActive = true
        store_name.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
        addSubview(type)
        type.topAnchor.constraint(equalTo: store_name.bottomAnchor,constant:8).isActive = true
        type.leftAnchor.constraint(equalTo: store_name.leftAnchor).isActive = true
        type.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/2).isActive = true
        type.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
        addSubview(miles)
        miles.topAnchor.constraint(equalTo: type.topAnchor).isActive = true
        miles.rightAnchor.constraint(equalTo: img.rightAnchor).isActive = true
        miles.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/2).isActive = true
        miles.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
        addSubview(describe)
        describe.topAnchor.constraint(equalTo: type.bottomAnchor,constant:8).isActive = true
        describe.leftAnchor.constraint(equalTo: type.leftAnchor).isActive = true
        describe.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/2).isActive = true
        describe.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
        addSubview(close_time)
        close_time.topAnchor.constraint(equalTo: describe.topAnchor).isActive = true
        close_time.rightAnchor.constraint(equalTo: img.rightAnchor).isActive = true
        close_time.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:1/2).isActive = true
        close_time.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
        
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

class StoreListView: BasicView,UITableViewDelegate,UITableViewDataSource {
    weak var delegate:storeTableDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StoreCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 314
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.storeList(storeSelect: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let title = UILabel(frame: CGRect(x: 16, y: 8, width: tableView.frame.width-32, height: 32))
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        title.text = "Top Seller"
        view.addSubview(title)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    lazy var tableView:UITableView={
        let table = UITableView(frame: .zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        table.register(StoreCell.self, forCellReuseIdentifier: "cell")
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
