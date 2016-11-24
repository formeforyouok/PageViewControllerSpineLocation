//
//  ZHViewController.swift
//  PageViewController
//
//  Created by CtyleCorporation on 16/11/24.
//  Copyright © 2016年 ctyle. All rights reserved.
//

import UIKit

class ZHViewController: UIViewController {

    var dataArray : Array<BaseModel> = []
    
    var pageViewController : UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        prepareData()
        pageViewControllerConfig()
    }
    
    func prepareData(){
        for i in 0 ..< 20 {
            let page = BaseModel()
            page.viewController = ZHSubViewController()
            page.viewController?.currentPage = i
            dataArray.append(page)
        }
        
    }
    
    func pageViewControllerConfig(){
        
        pageViewController = UIPageViewController.init(transitionStyle: UIPageViewControllerTransitionStyle.pageCurl, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        
        setOnePage()
        pageViewController?.delegate = self
        pageViewController?.dataSource = self
        
        pageViewController?.view.frame = view.bounds
        view.addSubview(pageViewController!.view!)
    }
    
    func setOnePage(){
        let vc = dataArray[0].viewController
        pageViewController?.setViewControllers([vc!], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }
    
    func setDoublePage(){
        let vc = dataArray[0].viewController
        let nextVc = dataArray[1].viewController
        pageViewController?.setViewControllers([vc!,nextVc!], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ZHViewController : UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let subvc = viewController as! ZHSubViewController
        var index = subvc.currentPage
        index = index + 1
        if index >= dataArray.count {
            index = dataArray.count - 1
            return nil
        }
        return dataArray[index].viewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let subvc = viewController as! ZHSubViewController
        var index = subvc.currentPage
        index = index - 1
        if index < 0 {
            index = 0
            return nil
        }
        return dataArray[index].viewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if UIInterfaceOrientationIsLandscape(orientation) {
            setDoublePage()
            return UIPageViewControllerSpineLocation.mid
        }
        setOnePage()
        return UIPageViewControllerSpineLocation.min
    }
}
