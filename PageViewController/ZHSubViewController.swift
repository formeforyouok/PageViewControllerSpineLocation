//
//  ZHSubViewController.swift
//  PageViewController
//
//  Created by CtyleCorporation on 16/11/24.
//  Copyright © 2016年 ctyle. All rights reserved.
//

import UIKit

class ZHSubViewController: UIViewController {

    var currentPage : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiConfig()
        
        // Do any additional setup after loading the view.
    }
    
    func uiConfig(){
        self.view.backgroundColor = UIColor(colorLiteralRed: (Float(arc4random()%255)) / 255.0, green: (Float(arc4random()%255)) / 255.0, blue: (Float(arc4random()%255)) / 255.0, alpha: 1)
        
        //这里label最好做好约束
        let label = UILabel()
//        label.frame = self.view.bounds
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(label)
        
        //#MARK - 目前用系统的约束，你也可以导入第三方库做约束
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let leftConstraint = NSLayoutConstraint.init(item: label, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint.init(item: label, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint.init(item: label, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0)
        let bottomCostraint = NSLayoutConstraint.init(item: label, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0)
//        self.view.addConstraints([leftConstraint,rightConstraint,topConstraint,bottomCostraint])
        
        leftConstraint.isActive = true
        rightConstraint.isActive = true
        topConstraint.isActive = true
        bottomCostraint.isActive = true
        
        label.text = "\(currentPage)"
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
