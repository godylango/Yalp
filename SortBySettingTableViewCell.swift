//
//  SortBySettingTableViewCell.swift
//  yalp
//
//  Created by dylan on 9/23/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import UIKit

class SortBySettingTableViewCell: UITableViewCell {
    var onCheck: (() -> Void) = {}
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBAction func didCheck(sender: AnyObject) {
                    self.checkButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.onCheck()
        
    }
    func configure(method: String, isActive: Bool, onCheck: (() -> Void)) {
        self.descriptionLabel.text = method
        self.onCheck = onCheck
        if isActive {
            self.checkButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        } else {
            self.checkButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
