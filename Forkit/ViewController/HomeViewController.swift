//
//  HomeViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit



class HomeViewController: UIViewController {

    let navigator:HomeNavigator={
        let navi = HomeNavigator()
        return navi
    }()
    
    let categoryView:CategoryView={
        let cate = CategoryView()
        return cate
    }()
    
    let storeList:StoreListView={
        let list = StoreListView()
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        // Do any additional setup after loading the view.
    }
    
    func initView(){
        view.addSubview(navigator)
        navigator.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigator.heightAnchor.constraint(equalToConstant: 128).isActive = true

        view.addSubview(categoryView)
        categoryView.topAnchor.constraint(equalTo: navigator.bottomAnchor).isActive = true
        categoryView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        categoryView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        categoryView.heightAnchor.constraint(equalToConstant: 112).isActive = true

        view.addSubview(storeList)
        storeList.topAnchor.constraint(equalTo: categoryView.bottomAnchor).isActive = true
        storeList.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storeList.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        storeList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
