//
//  SearchResultsViewController.swift
//  yalp
//
//  Created by dylan on 9/19/14.
//  Copyright (c) 2014 ClarkProvisions. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var filtersLabelView: UIBarButtonItem!
    @IBOutlet weak var searchResultsTable: UITableView!

    let searchBar: UISearchBar = UISearchBar(frame: CGRectZero)
    let searcher: YelpSearcher = YelpSearcher.searcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTable.estimatedRowHeight = 68.0
        searchResultsTable.rowHeight = UITableViewAutomaticDimension

        installSearchBar()
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        println(searchBar.text)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.searcher.search(searchText, onSuccess: self.searchResultsTable.reloadData)
        println(searchBar.text)
    }
    
    func installSearchBar() {
        self.searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        self.searcher.search("thai", onSuccess: self.searchResultsTable.reloadData)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searcher.results.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SearchResult") as SearchResultTableViewCell
        cell.configure(self.searcher.results[indexPath.row])
        return cell
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
