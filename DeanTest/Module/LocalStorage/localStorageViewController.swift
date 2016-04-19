//
//  localStorageViewController.swift
//  DeanTest
//
//  Created by Dean on 15/7/26.
//  Copyright (c) 2015年 Dean. All rights reserved.
//

import UIKit

class localStorageViewController: BaseViewController {
    
    var textField:UITextField?
    var userData:NSUserDefaults?
    
    var key:Int = 0
    var getKey:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTitle(name: "本地存储")
        
        userData = NSUserDefaults()
        
        initLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initLayer() {
        //UITextField
        textField = UITextField(frame: CGRect(x: screenSize.width*0.25, y: screenSize.height*0.3,
            width: screenSize.width*0.5, height: screenSize.height*0.1))
        self.view.addSubview(textField!)
        textField?.borderStyle = UITextBorderStyle.Line
        //textField?.adjustsFontSizeToFitWidth = true
        
        let button:UIButton = UIButton(frame: CGRect(x: screenSize.width*0.5-50, y: screenSize.height*0.5,
            width: 100, height: 50))
        self.view.addSubview(button)
        button.setTitle("存储数据", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.blackColor()
        button.addTarget(self, action: #selector(localStorageViewController.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        let getDataBtn:UIButton = UIButton(frame: CGRect(x: screenSize.width*0.5-75,
            y: screenSize.height*0.5+60, width: 150, height: 50))
        self.view.addSubview(getDataBtn)
        getDataBtn.setTitle("获取存储数据", forState: UIControlState.Normal)
        getDataBtn.backgroundColor = UIColor.greenColor()
        getDataBtn.addTarget(self, action: #selector(localStorageViewController.getData(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        let showPathBtn:UIButton = UIButton(frame: CGRect(x: screenSize.width*0.5-75,
            y: screenSize.height*0.5+120, width: 150, height: 50))
        self.view.addSubview(showPathBtn)
        showPathBtn.setTitle("显示存储路径", forState: UIControlState.Normal)
        showPathBtn.backgroundColor = UIColor.blueColor()
        showPathBtn.addTarget(self, action: #selector(localStorageViewController.showPath(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func buttonClick(sender:UIButton) {
        let key_temp:String = NSString(format: "%d", key) as String
        let obj: AnyObject? = userData?.objectForKey(key_temp)
        if ((obj) != nil) {
            showAlert(Message: "数据已经存在！")
        }
        else {
            userData?.setObject(textField?.text, forKey: key_temp)
            showAlert(Message: "数据存储成功！")
        }
        key += 1
    }
    
    func getData(sender:UIButton) {
        let key_temp:String = NSString(format: "%d", getKey) as String
        let obj: AnyObject? = userData?.objectForKey(key_temp)
        if ((obj) != nil) {
            print(":\(obj)")
            let msg:String = NSString(format: "获取数据：key（%d）内容 ：（%s）！", getKey, (obj?.options)!) as String
            showAlert(Message: msg)
        }
        else {
            showAlert(Message: "数据为空！")
        }
        getKey += 1
    }
    
    func showPath(sender:UIButton) {
        print(":\(NSHomeDirectory())")
        showAlert(Message: "输出存储地址！")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
