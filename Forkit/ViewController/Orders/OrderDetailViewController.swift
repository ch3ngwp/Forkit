//
//  OrderDetailViewController.swift
//  Forkit
//
//  Created by 笨蛋 on 12/3/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit
class OrderDetailViewController: UIViewController {

    
   
    
    let navigation:MyNavigator={
        let navi = MyNavigator()
        navi.title.text = "Order Dtail"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        initNavigation()
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
