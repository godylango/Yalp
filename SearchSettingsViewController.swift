//
//  SearchSettingsViewController.swift
//  yalp
//
//  Created by dylan on 9/23/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func didTapSearch(sender: AnyObject) {
        self.searcher.deals = self.deals ? "true" : "false"
        self.searcher.radius = "\(self.radius)"
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var searchSettingsTableView:UITableView!
    
    var searcher: YelpSearcher = YelpSearcher.searcher()
    var deals: Bool = false
    var radius: Int = 100
    var distanceExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.deals = self.searcher.deals == "true"
        self.radius = self.searcher.radius.toInt()!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: // Category
            return 1
        case 1: // Sort by
            return 1
        case 2: // Distance
            return self.distanceExpanded ? 3 : 1
        case 3:// Deals
            return 1
        default:
            return 0
        }
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 2:
            return getDistanceCell(indexPath)
        case 3:
            return getDealsCell()
        default:
            return searchSettingsTableView.dequeueReusableCellWithIdentifier("setting") as UITableViewCell
        }

    }
    
    func getDealsCell() -> UITableViewCell {
        var cell = searchSettingsTableView.dequeueReusableCellWithIdentifier("dealsCell") as DealsViewCell
        cell.configure(self.deals, onSwitch: {
            self.deals = !self.deals
        })
        return cell
    }
    
    func getDistanceCell(indexPath: NSIndexPath) -> UITableViewCell {
        if distanceExpanded {
            var amount: Int = 0
            switch indexPath.row {
            case 0:
                amount = 100
            case 1:
                amount = 1000
            case 2:
                amount = 10000
            default:
                amount = 0
            }
            var cell = searchSettingsTableView.dequeueReusableCellWithIdentifier("radiusCell") as RadiusSettingTableViewCell
            cell.configure(indexPath.row, amount: amount, isActive: amount == self.radius, onCheck: {
                    self.radius = amount
                    self.toggleDistanceClosed()
            })
            return cell
        } else {
            var cell = searchSettingsTableView.dequeueReusableCellWithIdentifier("radiusCollapsedCell") as RadiusCollapsedSettingTableViewCell
            cell.currentRadiusLabel.text = "\(self.radius) Meters"
            self.setUpTapAction(cell, action: "toggleDistanceOpen")
            return cell
        }
    }
    
    func toggleDistanceOpen() {
        self.distanceExpanded = true
        self.searchSettingsTableView.reloadSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    func toggleDistanceClosed() {
        self.distanceExpanded = false
        self.searchSettingsTableView.reloadSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func setUpTapAction(cell: UITableViewCell, action: Selector) {
        var tap = UITapGestureRecognizer(target: self, action: action)
        tap.numberOfTapsRequired = 1
        cell.addGestureRecognizer(tap)
    }
}
