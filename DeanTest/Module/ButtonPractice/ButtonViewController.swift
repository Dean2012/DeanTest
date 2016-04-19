//
//  ButtonViewController.swift
//  DeanTest
//
//  Created by Dean on 15/7/25.
//  Copyright (c) 2015年 Dean. All rights reserved.
//

import UIKit

class ButtonViewController: BaseViewController {
    
    var button:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initTitle(name: "按钮练习")
        
        createButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createButton() {
        button = UIButton(frame: CGRect(x: screenSize.width*0.5-50, y: screenSize.height*0.4,
            width: 100, height: 40))
        button?.setTitle("点我点我", forState: UIControlState.Normal)
        button?.backgroundColor = UIColor.redColor()
        button?.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(button!)
        button?.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func buttonClick(sender:UIButton) {
        let alert = UIAlertView()
        alert.message = "点击成功！"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
}
