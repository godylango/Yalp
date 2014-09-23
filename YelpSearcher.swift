//
//  YelpSearcher.swift
//  yalp
//
//  Created by dylan on 9/21/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//
class YelpSearcher {
    let client: YelpClient!
    var results: [Business] = []
    let yelpConsumerKey = "uKy-HEYpR2HzEx5Vh0nBOw"
    let yelpConsumerSecret = "dsEWiwZwhDJicj5m1iGPQQFP8dE"
    let yelpToken = "Vslo1U5Ojqp0JdVXk0NpYx0CWR3eL-Ns"
    let yelpTokenSecret = "78_8rWR6LgNKYeIlFW7Yhqm0s5I"
    
    init () {
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
    }
    
    func search(term: String, onSuccess: (() -> Void)) {
        // Do any additional setup after loading the view, typically from a nib.
        client.searchWithTerm(term,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                self.results = Business.fromResponse((response["businesses"] as [NSDictionary]))
                onSuccess()
                return
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
    }
}
