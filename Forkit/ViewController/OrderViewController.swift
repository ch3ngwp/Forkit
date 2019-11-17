//
//  OrderViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    let navigation:MyNavigator={
        let navi = MyNavigator()
        navi.title.text = "Orders"
        return navi
    }()
    
    let orderList:orderListView={
        let list = orderListView()
        return list
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(navigation)
        navigation.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigation.heightAnchor.constraint(equalToConstant: isPhoneX ? 88 : 64).isActive = true
        navigation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigation.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        view.addSubview(orderList)
        orderList.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        orderList.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderList.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        orderList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
