//
//  CategotyView.swift
//  Forkit
//
//  Created by 笨蛋 on 9/28/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import UIKit

class CateCell:UICollectionViewCell{
    let img:UIImageView={
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let name:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.75)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    func setImage(image:String){
        img.image = UIImage(named: image)
        name.text = image
    }
    
    override func prepareForReuse() {
        img.image = nil
        name.text = ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(img)
        img.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        img.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        img.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier:2/3).isActive = true
        img.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier:3/4).isActive = true

        addSubview(name)
        name.topAnchor.constraint(equalTo: img.bottomAnchor).isActive = true
        name.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        name.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        name.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CategoryView: BasicView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let categoryList = ["Noodles","Ramen","Pizza","Salad","Taco"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CateCell
        cell.setImage(image: categoryList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.height)
    }

    
    lazy var collectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.collectionViewLayout = layout
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.clear
        collection.register(CateCell.self, forCellWithReuseIdentifier: "cell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let divider:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        addSubview(divider)
        divider.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor,constant:-1).isActive = true
        divider.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        divider.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
