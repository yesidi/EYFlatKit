//
//  ViewController.swift
//  EYFlatKit
//
//  Created by ye on 15/8/7.
//  Copyright (c) 2015年 eddieyip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(rgba: EYFlatColorType.clouds.rawValue)
        
        var eybtn = EYFlatButton(title: "hello world", color: EYFlatColorType.peterRiver, cornerRedius: 5, frame: CGRect(origin: CGPoint(x: 44, y: 44), size: CGSize(width: 180, height: 40)))
        eybtn.center = self.view.center
        self.view.addSubview(eybtn)
        
        var eybtnA = EYFlatButton(title: "hello world", color: EYFlatColorType.greenSea, cornerRedius: 5, frame: CGRect(origin: CGPoint(x: 44, y: 44), size: CGSize(width: 180, height: 40)))
        eybtnA.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 80)
        self.view.addSubview(eybtnA)
        
        var eybtnB = EYFlatButton(title: "hello world", color: EYFlatColorType.alizarin, cornerRedius: 5, frame: CGRect(origin: CGPoint(x: 44, y: 44), size: CGSize(width: 180, height: 40)))
        eybtnB.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 160)
        self.view.addSubview(eybtnB)
        
        var eybtnC = EYFlatButton(title: "hello world", color: EYFlatColorType.amethyst, cornerRedius: 5, frame: CGRect(origin: CGPoint(x: 44, y: 44), size: CGSize(width: 180, height: 40)))
        eybtnC.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 80)
        self.view.addSubview(eybtnC)
        
        var eybtnD = EYFlatButton(title: "hello world", color: EYFlatColorType.carrot, cornerRedius: 5, frame: CGRect(origin: CGPoint(x: 44, y: 44), size: CGSize(width: 180, height: 40)))
        eybtnD.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 160)
        eybtnD.enabled  = false
        self.view.addSubview(eybtnD)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

