//
//  SearchSettingsViewController.swift
//  yalp
//
//  Created by dylan on 9/23/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchSettingsTableView:UITableView!
    
    var distanceExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: //Category
            return 1
        case 1: //Sort by
            return 1
        case 2: //Distance
            return self.distanceExpanded ? 5 : 1
        case 3://Deals
            return 4
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = searchSettingsTableView.dequeueReusableCellWithIdentifier("setting") as UITableViewCell
        if (indexPath.section == 2) {
            self.setUpDistanceForToggling(cell)
        }
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Category"
        case 1:
            return "Sort by"
        case 2:
            return "Distance"
        case 3:
            return "Deals"
        default:
            return ""
        }
    }
    
    func toggleDistance() {
        self.distanceExpanded = !self.distanceExpanded
        self.searchSettingsTableView.reloadSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func setUpDistanceForToggling(cell: UITableViewCell) {
        var tap = UITapGestureRecognizer(target: self, action: "toggleDistance")
        tap.numberOfTapsRequired = 1
        cell.addGestureRecognizer(tap)
    }
}
