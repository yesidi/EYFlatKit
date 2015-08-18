//
//  EYFlatKit.swift
//  EYFlatKit
//
//  Created by ye on 15/8/7.
//  Copyright (c) 2015年 eddieyip. All rights reserved.
//

import Foundation
import UIKit

//UIButton
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
        self.mask.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
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
        UIView.animateWithDuration(0.3,
            animations: {
                self.mask.alpha = 0.3
            }, completion: nil)
        return super.beginTrackingWithTouch(touch, withEvent: event)
    }
    
    override func endTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) {
        UIView.animateWithDuration(0.3,
            animations: {
                self.mask.alpha = 0
            }, completion: nil)
        return super.endTrackingWithTouch(touch, withEvent: event)
    }
}

//UITextfield
class EYFlatTextField:UITextField {
    var isShowPath = false
    var pathColorDefault:UIColor = UIColor(rgba: EYFlatColorType.silver.rawValue)
    var pathColor:UIColor = UIColor(rgba: EYFlatColorType.silver.rawValue)
    
    init(isShowPath:Bool, pathColor:UIColor?, placeText:String, frame:CGRect) {
        self.isShowPath = isShowPath
        if let _pathColor = pathColor {
            self.pathColor = _pathColor
        }
        super.init(frame: frame)
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 8, 8)
    }
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 8, 8)
    }
    
    override func becomeFirstResponder() -> Bool {
        self.setNeedsDisplay()
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        self.setNeedsDisplay()
        return super.resignFirstResponder()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        var minX = CGRectGetMinX(rect)
        var midX = CGRectGetMidX(rect)
        var maxX = CGRectGetMaxX(rect)
        
        minX += 2
        maxX -= 2

        var minY = CGRectGetMinY(rect)
        var midY = CGRectGetMidY(rect)
        var maxY = CGRectGetMaxY(rect)
        
        minY +=  2
        maxY -= 2
        
        var contex:CGContextRef! = UIGraphicsGetCurrentContext()
        
        var path = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, midX, minY)
        CGPathAddArcToPoint(path, nil, maxX, minY, maxX, maxY, 10)
        CGPathAddArcToPoint(path, nil, maxX, maxY, midX, maxY, 10)
        CGPathAddArcToPoint(path, nil, minX, maxY, minX, midY, 10)
        CGPathAddArcToPoint(path, nil, minX, minY, midX, minY, 10)
        CGPathCloseSubpath(path)
        
        CGContextAddPath(contex, path)
        
        CGContextSetStrokeColorWithColor(contex, self.isFirstResponder() ? self.pathColor.CGColor : pathColorDefault.CGColor)
        CGContextSetLineWidth(contex, 2)
        CGContextDrawPath(contex, kCGPathStroke)
    }
}


