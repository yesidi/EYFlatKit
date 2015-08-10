//
//  EYFlatKit.swift
//  EYFlatKit
//
//  Created by ye on 15/8/7.
//  Copyright (c) 2015年 eddieyip. All rights reserved.
//

import Foundation
import UIKit

class EYFlatButton: UIButton {
    var title:String?
    var color:EYFlatColorType!
    var cornerRedius:CGFloat
    var mask:UIView!
    
    init(title:String, color:EYFlatColorType, cornerRedius:CGFloat, frame:CGRect) {
        self.title = title
        self.color = color
        self.cornerRedius = cornerRedius
        super.init(frame: frame)
        
        self.enabled = true
        
        self.mask = UIView()
        let hexColor = UIColor(rgba: color.rawValue)
        self.mask.backgroundColor = UIColor(white: 0.8, alpha: 1)
        self.mask.frame = bounds
        self.mask.alpha = 0
        self.layer.addSublayer(self.mask.layer)

        self.setTitle(title, forState: UIControlState.Normal)
        self.setTitle(title, forState: UIControlState.Highlighted)
        self.backgroundColor = UIColor(rgba: color.rawValue)

        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.cornerRedius
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
        println("beginTrackingWithTouch")
        UIView.animateWithDuration(0.1,
            animations: {
                self.mask.alpha = 0.5
            }, completion: nil)
        return super.beginTrackingWithTouch(touch, withEvent: event)
    }
    
    override func endTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) {
        UIView.animateWithDuration(0.1,
            animations: {
                self.mask.alpha = 0
            }, completion: nil)
        return super.endTrackingWithTouch(touch, withEvent: event)
    }
}
