//
//  HomeViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
import Moya
import Result


class HomeViewController: UIViewController,storeTableDelegate {
    
    
   
    

    //initial navigation bar
    let navigator:HomeNavigator={
        let navi = HomeNavigator()
        return navi
    }()
    
    //initial category part, check detail in categoryview.swift
    let categoryView:CategoryView={
        let cate = CategoryView()
        return cate
    }()
    
    //initial store list, check detail in StoreListView.swift
    let storeList:StoreListView={
        let list = StoreListView()
//        list.tableView.isScrollEnabled = false
        return list
    }()
    
    func storeList(storeSelect index: Int) {
        let vc = StoreViewController()
        self.present(vc, animated: false, completion: nil)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        let isAuth = UserDefaults.standard.bool(forKey: "Auth")
//        if(!isAuth){
//            let vc = LoginViewController()
//            self.present(vc, animated: false, completion: nil)
//        }
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(isPhoneX)
        initView()
        test()
        // Do any additional setup after loading the view.
    }
    
    
    //add constraint for each component(set position)
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
    
    
    func test(){
        let provider:MoyaProvider<testRequest> = MoyaProvider<testRequest>()
        provider.request(.test()){result in
            switch(result){
            case let .success(moyaResponse):
                do{
                    //here dataResponse received from a network request
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        moyaResponse.data, options: [])
                    print(jsonResponse)
                    
                } catch let parsingError {
                    print("Error", parsingError)
                }
            case let .failure(error):
                print(error)
            }
        }
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
