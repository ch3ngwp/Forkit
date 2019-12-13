//
//  extentions.swift
//  Forkit
//
//  Created by 笨蛋 on 11/16/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    var roundTo2f: Double {return Double(String(format: "%.2f", self)) ?? 0.00}
//    var roundTo3f: Double {return Double(round(1000 * self)/1000) }
}
extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


extension UITextField{
    func setIcon(name:String){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 48))
        let image = UIImageView(frame: CGRect(x: 20, y: 12, width: 24, height: 24))
        image.clipsToBounds = true
        image.image = UIImage(named: name)
        image.setImageColor(color: UIColor.black.withAlphaComponent(0.3))
        view.addSubview(image)
        self.leftViewMode = .always
        self.leftView = view
    }
}


extension UIButton{
    func setUnderlineTitle(title:String){
        let yourAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 16),
//                    .foregroundColor: UIColor.white,
                    .underlineStyle: NSUnderlineStyle.single.rawValue]
        
                let attributeString = NSMutableAttributedString(string: title,
                                                                attributes: yourAttributes)
                self.setAttributedTitle(attributeString, for: .normal)
    }
}
