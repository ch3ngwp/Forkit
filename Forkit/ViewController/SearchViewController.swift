//
//  SearchViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
import Moya
import Result
class SearchViewController: UIViewController,storeTableDelegate,SearchDelegate {

    
    var storeList:[Store] = []{
        didSet{
            self.storeListView.storeList = storeList
        }
    }
    
    lazy var navigation:searchNaviView={
        let navi = searchNaviView()
        navi.delegate = self
        return navi
    }()
    
    func handleSearchByName(name: String) {
        print(name)
        if name != ""{
            self.storeListView.storeList = storeList.filter{$0.name?.lowercased().contains(name.lowercased()) ?? false}
        }else{
            self.storeListView.storeList = storeList
        }
    }
    
    lazy var storeListView:StoreListView={
        let list = StoreListView()
        list.delegate = self
        return list
    }()
    
    func storeList(storeSelect id: String) {
        let vc = StoreViewController()
        vc.store_id = id
        self.present(vc, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(navigation)
        navigation.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigation.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigation.heightAnchor.constraint(equalToConstant: isPhoneX ? 212 : 188).isActive = true
        
        
        view.addSubview(storeListView)
        storeListView.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        storeListView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storeListView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        storeListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        FetchAllStore()
        // Do any additional setup after loading the view.
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
                            //                            if let image = dish["pic_url"] as? String{dishModal.imageURL = image}
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
                    print(responseJSON)
                    
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
