//
//  UIView+Accessories.swift
//  login_ui
//
//  Created by Dev on 18/07/2022.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var corner : CGFloat{
        set{
            self.clipsToBounds = newValue == 0 ? false : true
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderSize: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            if let col = self.layer.borderColor {
                return UIColor(cgColor: col)
            }
            return UIColor.white
        }
    }
}
