//
//  YelpSearcher.swift
//  yalp
//
//  Created by dylan on 9/21/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//
var _searcher: YelpSearcher = YelpSearcher()

class YelpSearcher {
    class func searcher() -> YelpSearcher {
        return _searcher
    }
    let client: YelpClient!
    var results: [Business] = []
    let yelpConsumerKey = "uKy-HEYpR2HzEx5Vh0nBOw"
    let yelpConsumerSecret = "dsEWiwZwhDJicj5m1iGPQQFP8dE"
    let yelpToken = "Vslo1U5Ojqp0JdVXk0NpYx0CWR3eL-Ns"
    let yelpTokenSecret = "78_8rWR6LgNKYeIlFW7Yhqm0s5I"
    
    var sort: String = "0"
    var radius: String = "10000"
    var deals: String = "false"
    
    init () {
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
    }
    
    func search(term: String, onSuccess: (() -> Void)) {
        
        var parameters = ["term": term,
            "location": "San Francisco",
            "limit": "10",
            "sort": self.sort,
            "radius_filter": self.radius,
            "deals_filter": self.deals
        ]
        
        client.searchWithParams(parameters,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                self.results = Business.fromResponse((response["businesses"] as [NSDictionary]))
                onSuccess()
                return
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
    }
    

}
