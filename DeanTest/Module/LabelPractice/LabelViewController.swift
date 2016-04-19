//
//  LabelViewController.swift
//  DeanTest
//
//  Created by Dean on 15/7/25.
//  Copyright (c) 2015年 Dean. All rights reserved.
//

import UIKit

class LabelViewController: BaseViewController {
    
    var labelHeight:CGFloat?
    var label:UILabel?
    var button:UIButton?
    var currentNum:Int = 0
    
    let textList = ["背景颜色","字体颜色","字体变化","字体大小","字体居中"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initTitle(name: "字体练习")
        
        labelHeight = screenSize.height*0.2
        
        print("labelHeight:\(labelHeight)")
        
        initLayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initLayer() {
        
        label = UILabel(frame: CGRect(x: screenSize.width*0.5-50, y: labelHeight!, width: 100, height: 20))
        label?.text = textList[currentNum]
        label?.backgroundColor = randomColor()
        label?.font = UIFont(name: "华文楷体", size: 17.0)
        self.view.addSubview(label!)
        
        let nextNum = currentNum > (textList.count-1) ? currentNum : 0
        button = UIButton(frame: CGRect(x: screenSize.width*0.5-100, y: labelHeight!+40, width: 200, height: 20))
        button?.setTitle("下一个："+textList[nextNum], forState: UIControlState.Normal)
        button?.backgroundColor = randomColor()
        button?.addTarget(self, action:"buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button!)
        
    }
    
    func buttonClick(sender:UIButton!) {
        currentNum++
        print("currentNum:\(currentNum) , textListcount:\(textList.count) ")
        currentNum = currentNum > (textList.count-1) ? 0 : currentNum
        print("buttonCLick:\(currentNum) ")
        
        updateLabel()
    }
    
    func updateLabel() {
        switch (currentNum) {
            case LabelViewEnum.BACKGROUND_COLOR.rawValue:
                label?.backgroundColor = randomColor()
                label?.textAlignment = NSTextAlignment.Left
                break
            
            case LabelViewEnum.LABEL_COLOR.rawValue:
                label?.textColor = UIColor.whiteColor()//randomColor()
                break
            
            case LabelViewEnum.LABEL_FONT.rawValue:
                label?.textColor = UIColor.blackColor()
                label?.font = UIFont(name: "华文宋体", size: 17.0)
                break
            
            case LabelViewEnum.LABEL_SIZE.rawValue:
                label?.font = UIFont(name: "华文楷体", size: 25.0)
                break
            
            case LabelViewEnum.LABEL_ALIGMENT.rawValue:
                label?.font = UIFont(name: "华文楷体", size: 17.0)
                label?.textAlignment = NSTextAlignment.Center
                break
            
            default:
                break
        }
        changNextText()
    }
    
    func changNextText() {
        label?.text = textList[currentNum]
        
        let nextNum = currentNum > (textList.count-1) ? currentNum : 0
        button?.setTitle("下一个："+textList[nextNum], forState: UIControlState.Normal)
    }
    
}
