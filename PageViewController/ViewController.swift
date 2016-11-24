//
//  ViewController.swift
//  PageViewController
//
//  Created by CtyleCorporation on 16/11/17.
//  Copyright © 2016年 ctyle. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let datas = ["ZHViewController","ZHPageViewController"]
    let cellid : String =  "cellid"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PageViewControllerModel"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellid)
        }
        cell?.textLabel?.text = datas[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let vc = ZHViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let vc = ZHPageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

