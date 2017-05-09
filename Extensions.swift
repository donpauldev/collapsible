//
//  Extensions.swift
//  dalleel
//
//  Created by AJESHKUMAR CHEMPANKULAM DIVAKARAN on 10/03/17.
//  Copyright © 2017 a2solutions. All rights reserved.
//


import Foundation

extension UIColor {
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   0 / 255.0,
            green: 180  / 255.0,
            blue:  90  / 255.0,
            alpha: alpha
        )
    }
    
}

extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
    
}
