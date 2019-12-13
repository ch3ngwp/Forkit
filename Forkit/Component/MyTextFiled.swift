//
//  File.swift
//  Forkit
//
//  Created by 笨蛋 on 11/15/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

import Foundation
import UIKit

class MyTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 32)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
