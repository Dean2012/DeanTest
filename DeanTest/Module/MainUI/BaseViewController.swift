//
//  BaseViewController.swift
//  DeanTest
//
//  Created by Dean on 15/7/25.
//  Copyright (c) 2015年 Dean. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let screenSize = UIScreen.mainScreen().bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // init title text 
    func initTitle(name Name:String) {
        let title = UILabel(frame: CGRect(x: screenSize.width*0.5-100, y: 80, width: 200, height: 20))
        title.textAlignment = NSTextAlignment.Center
        title.backgroundColor = UIColor.redColor()
        title.text = Name
        self.view.addSubview(title)
    }
}
