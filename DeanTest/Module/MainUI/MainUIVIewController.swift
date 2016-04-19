//
//  MainUIVIewController.swift
//  DeanTest
//
//  Created by Dean on 15/7/25.
//  Copyright (c) 2015年 Dean. All rights reserved.
//

import UIKit

class MainUIViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mainTableView:UITableView?
    
    let testItemList = ["数据存储", "PageView", "HTTP" ,"ScrollView", "CollectionView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.view.backgroundColor = UIColor.redColor()
        
        mainTableView = UITableView(frame: UIScreen.mainScreen().bounds)
        self.view.addSubview(mainTableView!)
        
        mainTableView?.delegate = self;
        mainTableView?.dataSource = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testItemList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "123")
        
        cell.textLabel?.text = testItemList[indexPath.row] as String
        
        // Configure the cell...
        return cell
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        // var view = ButtonViewController()
        // self.navigationController?.pushViewController(view, animated: true)
        
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(localStorageViewController()
                , animated: true)
        }
        else if indexPath.row == 1 {
            self.navigationController?.pushViewController(PageViewController(),
                animated: true)
        }
        else if indexPath.row == 2 {
            self.navigationController?.pushViewController(HttpTestViewController(),
                animated: true)
        }
        
        let xx = indexPath;
        return xx;
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        NSLog("willDisplayHeaderView");
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("didDeselectRowAtIndexPath");
    }

}

