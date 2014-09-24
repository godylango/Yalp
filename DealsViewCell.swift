//
//  DealsViewCell.swift
//  yalp
//
//  Created by dylan on 9/23/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import UIKit

class DealsViewCell: UITableViewCell {

    var onSwitch: (() -> Void) = {}
    var isSelected: Bool = false
    
    @IBOutlet weak var dealsSwitch: UISwitch!
    @IBAction func didSwitch(sender: AnyObject) {
        self.onSwitch()
    }
    
    func configure(isSelected: Bool, onSwitch: (() -> Void)) {
        self.onSwitch = onSwitch
        self.isSelected = isSelected
        
        self.dealsSwitch.setOn(isSelected, animated: false)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
