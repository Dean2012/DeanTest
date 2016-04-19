//
//  CollectionView.swift
//  DeanTest
//
//  Created by Dean on 15/7/28.
//  Copyright (c) 2015年 Dean. All rights reserved.
//

import UIKit

class CollectionView: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let dataList = ["1","2","3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTitle(name: "相册")
//        createView()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake((screenSize.width-7)/2, 210)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical//设置垂直显示
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 1, 0, 1)//设置边距
        flowLayout.minimumLineSpacing = 0.0;//每个相邻layout的上下
        flowLayout.minimumInteritemSpacing = 0.0;//每个相邻layout的左右
        flowLayout.headerReferenceSize = CGSizeMake(0, 0);
        
        let myCollectionView = UICollectionView(frame: CGRectMake(0, screenSize.height*0.2, screenSize.width, screenSize.height), collectionViewLayout: flowLayout)
        myCollectionView.backgroundColor = UIColor.whiteColor()
        myCollectionView.alwaysBounceVertical = true
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        view.addSubview(myCollectionView)
        
//        floorResultCollectionView.registerClass(FloorCollectionViewCell.self, forCellWithReuseIdentifier: "Cell") //这个是关键一定要这注册下
        
        
//        let myCollectionView = UICollectionView(frame: CGRect(x: 0, y: screenSize.height*0.2,
//            width: screenSize.width, height: screenSize.height*0.5))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createView() {
//        self.view.addSubview(myCollectionView!)
    }
    
    
    // collection begin
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10//dataList.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = UICollectionViewCell(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        cell.backgroundColor = randomColor()
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
//    {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
////        cell.textLabel.text = "Text"
////        cell.imageView.image = UIImage(named: "star")
//        return cell
//    }
    
    //实现UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        //某个Cell被选择的事件处理
    }
    
    
    // collection end
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
