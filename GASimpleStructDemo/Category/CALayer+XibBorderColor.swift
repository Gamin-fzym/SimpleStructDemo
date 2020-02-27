//
//  CALayer+XibBorderColor.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/26.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

extension CALayer {
    
   @IBInspectable var borderColorWithUIColor: UIColor {
        get {
            return UIColor(cgColor: self.borderColor!)
        }
        set {
            self.borderColor = newValue.cgColor
        }
    }
   
}

