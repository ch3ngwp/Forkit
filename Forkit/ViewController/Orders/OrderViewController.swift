//
//  OrderViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
import Moya
import Result
protocol orderViewDelegate:NSObjectProtocol {
    func showOrderDetail(orderId:String)
}

class OrderViewController: UIViewController,orderViewDelegate {
    var orderList:[Order] = []{
        didSet{
            self.orderListView.orderList = orderList
        }
    }
    let navigation:MyNavigator={
        let navi = MyNavigator()
        navi.title.text = "Orders"
        return navi
    }()
    
    lazy var orderListView:OrderListView={
        let list = OrderListView()
        list.delegate = self
        return list
    }()
    
    func showOrderDetail(orderId: String) {
        let vc = OrderDetailViewController()
        self.present(vc, animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FetchAllOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(navigation)
        navigation.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigation.heightAnchor.constraint(equalToConstant: isPhoneX ? 88 : 64).isActive = true
        navigation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigation.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        view.addSubview(orderListView)
        orderListView.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        orderListView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderListView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        orderListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // Do any additional setup after loading the view.
    }
    
    func FetchAllOrder(){
        let id = UserDefaults.standard.string(forKey: "user_id")
        let provider:MoyaProvider<OrderRequest> = MoyaProvider<OrderRequest>()
        provider.request(.FetchAllOrder(userId:"1")){result in
            switch(result){
            case let .success(moyaResponse):
                do{
//                    let json = NSString(data: moyaResponse.data, encoding: String.Encoding.utf8.rawValue)

                    let responseJSON = try JSONSerialization.jsonObject(with: moyaResponse.data, options: []) as! NSArray
                    for _order in responseJSON{
                        let orderModal:Order = Order()
                        let order = _order as! NSDictionary
                        if let id = order["id"] as? String{orderModal.id = id}
                        if let time = order["id"] as? String{orderModal.time = time}
                        if let price = order["id"] as? String{orderModal.price = price}
                        if let statusId = order["id"] as? String{orderModal.statu_id = statusId}
                        self.orderList.append(orderModal)
                    }
                    
                    print("order \(responseJSON)")
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
