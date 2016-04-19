//
//  PageViewController.swift
//  DeanTest
//
//  Created by Dean on 15/7/28.
//  Copyright (c) 2015年 Dean. All rights reserved.
//

import UIKit

class PageViewController: BaseViewController,UIScrollViewDelegate {
    
    var myScrollView:UIScrollView?
    var pageController:UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTitle(name: "翻页练习")
        
        // scrollview
        wayOne()
        
//        var curPage = createPage()
//        self.view.addSubview(curPage)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wayOne() {
        myScrollView = UIScrollView(frame: CGRect(x: 0, y: screenSize.height*0.2,
            width: screenSize.width, height: screenSize.height*0.5))
        self.view.addSubview(myScrollView!)
        myScrollView?.backgroundColor = randomColor()
        myScrollView?.delegate = self
        myScrollView!.pagingEnabled = true
        myScrollView!.contentSize = CGSize(width: screenSize.width*3, height: screenSize.height*0.5)
        
        let page1 = createPage(X: 0)
        myScrollView?.addSubview(page1)
        
        let page2 = createPage(X: screenSize.width)
        myScrollView?.addSubview(page2)
        
        let page3 = createPage(X: screenSize.width*2)
        myScrollView?.addSubview(page3)
        
        pageController = UIPageControl(frame: CGRect(
            x: screenSize.width*0.5-50,
            y: screenSize.height*0.8,
            width: 100, height: 50))
        self.view.addSubview(pageController!)
        pageController?.backgroundColor = UIColor.redColor()
        pageController?.numberOfPages = 3
        pageController?.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func createPage(X x:CGFloat)->UIView {
        let page = UIView(frame: CGRect(x: x, y: 0,
            width: screenSize.width, height: screenSize.height*0.5))
        page.backgroundColor = randomColor()
        
        return page
    }
    
    func changePage(sender:UIPageControl) {
        print("\(sender.currentPage)")
        
        myScrollView?.contentOffset.x = screenSize.width * CGFloat(sender.currentPage)
    }
    
    // scrollview delegate
    // move
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("scrollViewDidScroll x pos = \(scrollView.contentOffset.x)")
        
    }
    
    // end move
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating x pos = \(scrollView.contentOffset.x)  screenWidth = \(screenSize.width)")
        if scrollView.contentOffset.x < screenSize.width
        {
            pageController?.currentPage = 0
        }
        else if scrollView.contentOffset.x >= screenSize.width && scrollView.contentOffset.x < screenSize.width * 2
        {
            pageController?.currentPage = 1
        }
        else if scrollView.contentOffset.x >= screenSize.width * 2 && scrollView.contentOffset.x < screenSize.width * 3
        {
            pageController?.currentPage = 2
        }
        print("\(pageController?.currentPage)")
    }
    // scrollview delegate end
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
