//
//  business.swift
//  yalp
//
//  Created by dylan on 9/21/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import Foundation

class Business {
    let name: String!
    let ratingImgUrl: String!
    let numReviews: Int!
    let businessImgUrl: String!
    let address: String!
   
    class func fromResponse(responseData: [NSDictionary]) -> [Business] {
        return responseData.map {
            (var datum) -> Business in return Business(attrs: datum)
        }
    }
    
    init (attrs: NSDictionary) {
        self.name = attrs["name"] as String
        self.ratingImgUrl = attrs["rating_img_url"] as String
        self.businessImgUrl = (attrs["image_url"] ?? "") as String
        self.numReviews = attrs["review_count"] as Int
    }
}
