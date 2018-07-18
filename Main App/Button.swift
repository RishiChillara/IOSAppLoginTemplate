//
//  Button.swift
//  Main App
//
//  Created by Rishi Chillara on 7/16/18.
//  Copyright © 2018 RCStudios. All rights reserved.
//

import UIKit

@IBDesignable class Button: UIButton {

        override func layoutSubviews() {
            super.layoutSubviews()
            
            updateCornerRadius()
        }
        
        @IBInspectable var rounded: Bool = false {
            didSet {
                updateCornerRadius()
            }
        }
        
        func updateCornerRadius() {
            layer.cornerRadius = rounded ? frame.size.height / 2 : 0
            layer.masksToBounds = true
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
