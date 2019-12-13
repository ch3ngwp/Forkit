//
//  CategoryListViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 12/4/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
import Moya
import Result
class CategoryListViewController: UIViewController,storeTableDelegate {
    var storeList:[Store] = []{
        didSet{
            self.storeListView.storeList = storeList
        }
    }
    
    let navigation:MyNavigator={
        let navi = MyNavigator()
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
    
    override func viewWillAppear(_ animated: Bool) {
        FetchAllStore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        initNavigation()
        
        view.addSubview(storeListView)
        storeListView.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        storeListView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storeListView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        storeListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
