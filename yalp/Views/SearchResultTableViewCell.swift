//
//  SearchResultTableViewCell.swift
//  yalp
//
//  Created by dylan on 9/18/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import UIKit
import QuartzCore

class SearchResultTableViewCell: UITableViewCell {
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var searchResultLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(business: Business) {
        self.searchResultLabel.text = business.name

        self.businessImageView.setImageWithURL(NSURL(string: business.businessImgUrl))
        self.businessImageView.layer.cornerRadius = 5.0
        self.businessImageView.clipsToBounds = true
        self.ratingImageView.setImageWithURL(NSURL(string: business.ratingImgUrl))
    }

}
