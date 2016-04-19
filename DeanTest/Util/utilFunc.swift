//
//  utilFunc.swift
//  DeanTest
//
//  Created by Dean on 15/7/25.
//  Copyright (c) 2015年 Dean. All rights reserved.
//

import UIKit

// 返回随机颜色
func randomColor()->UIColor {
    let length = colorList.count - 1
    let num = arc4random_uniform(UInt32(length))
    let color:UIColor = colorList[Int(num)]
    return color
}

func showAlert(Message msg:String) {
    let alert = UIAlertView()
    alert.message = msg
    alert.addButtonWithTitle("OK")
    alert.show()
}