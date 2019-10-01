//
//  TabbarViewController.swift
//  EasyAppointment
//
//  Created by 笨蛋 on 3/27/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

class TabbarViewController:UITabBarController,UITabBarControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.delegate = self
        self.view.backgroundColor = UIColor.white
        creatViewController()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return false
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        UserDefaults.standard.set("\(tabBarController.selectedIndex)", forKey: "selectedIndex")
        //        tabBarController.
    }
    
    func creatViewController(){
        let home = HomeViewController()
        let search = SearchViewController()
        let order = OrderViewController()
        let account = AccountViewController()

        //        let setting = FormViewController()
        let tabArray = [home,search,order,account]
        self.viewControllers = tabArray
        self.tabBar.barTintColor = UIColor.white;
        
        self.tabBar.tintColor = MyColor.themeColor
        self.tabBar.items?[0].title = "Home"
        self.tabBar.items?[0].image = UIImage(named: "store")
        
        self.tabBar.items?[1].title = "Search"
        self.tabBar.items?[1].image = UIImage(named: "search")
        
        self.tabBar.items?[2].title = "Orders"
        self.tabBar.items?[2].image = UIImage(named: "order")
        
        self.tabBar.items?[3].title = "Account"
        self.tabBar.items?[3].image = UIImage(named: "account")
        
        
        self.tabBar.isTranslucent = false
        self.tabBar.unselectedItemTintColor = UIColor.gray.withAlphaComponent(0.5)
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
