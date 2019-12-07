//
//  StoreViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 10/19/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
import Moya
import Result

class StoreViewController: UIViewController,MenuTableDelegate {
    let provider:MoyaProvider<StoreRequest> = MoyaProvider<StoreRequest>()
    var store_id:String?{
        didSet{
            provider.request(.FetchStoreById(storeId:store_id ?? "")){result in
                switch(result){
                case let .success(moyaResponse):
                    do{
                        let responseJSON = try JSONSerialization.jsonObject(with: moyaResponse.data, options: []) as? [String: Any]
                        let store = responseJSON?["0"] as! NSDictionary
                        print(responseJSON)
                        let storeModal:Store = Store()
                        if let id = store["restaurant_id"] as? String {storeModal.id = id}
                        if let name = store["name"] as? String {storeModal.name = name}
                        if let phone = store["phone"] as? String {storeModal.phone = phone}
                        if let desc = store["description"] as? String {storeModal.desc = desc}

                        var Dishes:[Dish] = []
                        let dishes = responseJSON?["dish"] as! NSArray
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
                        self.storeDate = storeModal
                        
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
//                    let responseJSON = try? JSONSerialization.jsonObject(with: moyaResponse.data, options: [])
//                    if let responseJSON = responseJSON as? [String: Any] {
//                        print(responseJSON)
//                    }
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    var selectedDishes:[Dish] = []{
        didSet{
            
        }
    }
    
    var storeDate:Store?{
        didSet{
            storeInfoView.storeData = storeDate
            menuList.dishList = storeDate?.dishes
        }
    }
    
    func handleOrderInformation(number: Int, price: Double) {
//        self.selectedDishes.append(dish!)
        let priceIndex = price.roundTo2f
        orderView.total_price = number == 1 ? orderView.total_price + priceIndex : orderView.total_price - priceIndex
        orderView.item_number = orderView.item_number + number
    }
    
    
    let navigation:MyNavigator={
        let navi = MyNavigator()
        navi.backgroundColor = UIColor.clear
        navi.title.text = ""
        return navi
    }()
    
    let arrow_image:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "left_arrow")
        img.setImageColor(color: MyColor.themeColor)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var back_button:UIButton={
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Back", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        btn.setTitleColor(MyColor.themeColor, for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        return btn
    }()
    
    @objc func back(){
        self.dismiss(animated: false, completion: nil)
    }
    
    let storeInfoView:StoreInfoView={
        let view = StoreInfoView()
        return view
    }()
    
    lazy var menuList:MenuListView={
        let view = MenuListView()
        view.delegate = self
        return view
    }()
    
    lazy var orderView:OrderPlaceView={
        let view = OrderPlaceView()
        view.order_button.addTarget(self, action: #selector(placeOrder), for: .touchUpInside)
        return view
    }()
    
    @objc func placeOrder(){
        print("place order")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        initView()
        // Do any additional setup after loading the view.
    }
    
    func initView(){
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

        view.addSubview(storeInfoView)
        storeInfoView.topAnchor.constraint(equalTo: navigation.bottomAnchor,constant:16).isActive = true
        storeInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storeInfoView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        storeInfoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(orderView)
        orderView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        orderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        orderView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        
        view.addSubview(menuList)
        menuList.topAnchor.constraint(equalTo: storeInfoView.bottomAnchor,constant:8).isActive = true
        menuList.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuList.bottomAnchor.constraint(equalTo: orderView.topAnchor).isActive = true
        menuList.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

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
