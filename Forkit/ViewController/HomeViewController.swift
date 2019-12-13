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


class HomeViewController: UIViewController,storeTableDelegate,HomeNavigationDelegate,CategoryDelegate {
    var storeList:[Store] = []{
        didSet{
            self.storeListView.storeList = storeList
        }
    }
    
    //initial navigation bar
    lazy var navigator:HomeNavigator={
        let navi = HomeNavigator()
        navi.delegate = self
        return navi
    }()
    
    func selectLocation() {
        let vc = LocationViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    //initial category part, check detail in categoryview.swift
    lazy var categoryView:CategoryView={
        let cate = CategoryView()
        cate.delegate = self
        return cate
    }()
    
    func categorySelecte(categoryId: Int, title: String) {
        let vc = CategoryListViewController()
        vc.navigation.title.text = title
//        vc.sto = "1"
        self.present(vc, animated: false, completion: nil)
    }
    
    
    //initial store list, check detail in StoreListView.swift
    lazy var storeListView:StoreListView={
        let list = StoreListView()
        list.title = "Top Seller"
        list.delegate = self
        return list
    }()
    
    func storeList(storeSelect id: String) {
        let vc = StoreViewController()
        vc.store_id = id
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
        FetchAllStore()
        // Do any additional setup after loading the view.
    }
    
    
    //add constraint for each component(set position)
    func initView(){
        view.addSubview(navigator)
        navigator.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigator.heightAnchor.constraint(equalToConstant: 136).isActive = true

        view.addSubview(categoryView)
        categoryView.topAnchor.constraint(equalTo: navigator.bottomAnchor).isActive = true
        categoryView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        categoryView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        categoryView.heightAnchor.constraint(equalToConstant: 112).isActive = true

        view.addSubview(storeListView)
        storeListView.topAnchor.constraint(equalTo: categoryView.bottomAnchor).isActive = true
        storeListView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storeListView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        storeListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    func FetchAllStore(){
        let provider:MoyaProvider<StoreRequest> = MoyaProvider<StoreRequest>()
        provider.request(.FetchAllStore()){result in
            switch(result){
            case let .success(moyaResponse):
                do{
                    let responseJSON = try JSONSerialization.jsonObject(with: moyaResponse.data, options: []) as! NSArray
                    
                    for _store in responseJSON{
                        let store = _store as! NSDictionary
                        let storeModal:Store = Store()
                        if let id = store["restaurant_id"] as? String{storeModal.id = id}
                        if let name = store["name"] as? String{storeModal.name = name}
                        if let desc = store["description"] as? String{storeModal.desc = desc}
                        
                        
                        var Dishes:[Dish] = []
                        let dishes = store["dishes"] as! NSArray
                        for _dish in dishes{
                            let dish = _dish as! NSDictionary
                            let dishModal:Dish = Dish()
                            if let id = dish["dish_id"] as? String {dishModal.id = id}
                            if let name = dish["dish_name"] as? String {dishModal.dish_name = name}
                            if let price = dish["price"] as? String {dishModal.price = Double(price)}
                            if let desc = dish["discription"] as? String {dishModal.desc = desc}
                            let pics = dish["pic"] as! NSArray
                            var picList:[String] = []
                            for _pic in pics{
                                let pic = _pic as!NSDictionary
                                if let pic_url = pic["pic_url"] as? String{picList.append(pic_url)}
                            }
                            dishModal.imageURL = picList
                            
                            Dishes.append(dishModal)
                        }
                        storeModal.dishes = Dishes
                        self.storeList.append(storeModal)
                    }                    
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
