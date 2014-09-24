//
//  YalpNavigationController.swift
//  yalp
//
//  Created by dylan on 9/23/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import UIKit

class YalpNavigationController: UINavigationController {
    var color = UIColor.whiteColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.tintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: color]
        self.navigationBar.titleTextAttributes = titleDict
        
        self.navigationBar.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
