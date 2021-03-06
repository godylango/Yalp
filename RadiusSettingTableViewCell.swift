//
//  RadiusSettingTableViewCell.swift
//  yalp
//
//  Created by dylan on 9/23/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import UIKit

class RadiusSettingTableViewCell: UITableViewCell {

    var amount: Int = 0
    var onCheck: (() -> Void) = {}
    var descriptionText: String {
        get {
            return "\(self.amount) Meters"
        }
    }

    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBAction func onChecked(sender: AnyObject) {
        self.onCheck()
    }

    
    func configure(number: Int, amount: Int, isActive: Bool, onCheck: (() -> Void)) {
        self.amount = amount
        self.onCheck = onCheck
        self.descriptionLabel.text = self.descriptionText
        
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
