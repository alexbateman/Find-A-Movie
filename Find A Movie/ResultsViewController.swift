//
//  ResultsViewController.swift
//  Find A Movie
//
//  Created by Alexander on 5/23/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UITableViewController, UISearchBarDelegate {
    
    var searchedMovies = [MovieResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedMovies.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)  as! MovieCustomTableViewCell
        let movie = searchedMovies[indexPath.row]
        cell.updatWithMovie(movie)
        
        return cell
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let searchTerm = searchBar.text ?? ""
        MovieTitleSearchController.getMovieFromSearchTerm(searchTerm) { (movies) in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.searchedMovies = movies
                self.tableView.reloadData()
            })
            
        }
    }
    
}
