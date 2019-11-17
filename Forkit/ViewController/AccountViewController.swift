//
//  AccountViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    let titles = ["Payment Setting","Locations","Become Chef","Contact Us","Log Out"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row==4){
            UserDefaults.standard.set(false, forKey: "Auth")
            self.dismiss(animated: false, completion: nil)
        }
    }
    

    let navigation:AccountNavigator={
        let navi = AccountNavigator()
        return navi
    }()
    
    lazy var tableView:UITableView={
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = false
        table.backgroundColor = UIColor.clear
        table.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        table.separatorColor = UIColor.black.withAlphaComponent(0.1)
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(navigation)
        navigation.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigation.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigation.heightAnchor.constraint(equalToConstant: 160).isActive = true

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // Do any additional setup after loading the view.
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
