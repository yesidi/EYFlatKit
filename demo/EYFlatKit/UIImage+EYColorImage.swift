//
//  UIImage+EYColorImage.swift
//  EYFlatKit
//
//  Created by ye on 15/8/7.
//  Copyright (c) 2015年 eddieyip. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func imageWithColor(color: UIColor, size:CGSize, radius:CGFloat) -> UIImage {
        
        let  rect =   CGRectMake ( 0 ,  0 , size.width*4, size.height*4)
        UIGraphicsBeginImageContext (rect.size)
        var  context:CGContextRef =  UIGraphicsGetCurrentContext()
        
        var path:CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, CGRectGetMidX(rect), 0)
        CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), 0, CGRectGetMaxX(rect), CGRectGetMidY(rect), radius);
        CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMidX(rect), CGRectGetMaxY(rect), radius)
        CGPathAddArcToPoint(path, nil, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMidY(rect), radius)
        CGPathAddArcToPoint(path, nil, CGRectGetMinX(rect), 0, CGRectGetMidX(rect), 0, radius)
        CGContextAddPath(context, path)
//        CGPathRelease(path)
        CGContextSetFillColorWithColor (context, color.CGColor)
        CGContextFillPath(context)
        CGContextSetStrokeColorWithColor(context, color.CGColor)
        CGContextStrokePath(context)
        
        var img =  UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return  img
    }
}