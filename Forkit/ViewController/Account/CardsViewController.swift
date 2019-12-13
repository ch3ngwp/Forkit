//
//  CardsViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 12/4/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var cards:[String] = []
    let navigation:MyNavigator={
        let navi = MyNavigator()
        navi.title.text = "Payment"
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
    
    lazy var tableView:UITableView={
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        //        table.tableFooterView = UIView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.cards[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 64))
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 64)
        button.setUnderlineTitle(title: "Add New Card")
        button.setTitleColor(MyColor.themeColor, for: .normal)
//        button.addTarget(self, action: #selector(autocompleteClicked), for: .touchUpInside)
        view.addSubview(button)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 64
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        initNavigation()
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
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
        back_button.widthAnchor.constraint(equalToConstant: 120).isActive = true
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
