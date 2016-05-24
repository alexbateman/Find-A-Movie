//
//  MovieTitleSearchController.swift
//  Find A Movie
//
//  Created by Alexander on 5/23/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation
import UIKit


class MovieTitleSearchController {
    
    static let baseurl = "https://api.themoviedb.org/3"
    static let api_key = "4b308409fcb85308d879aed05c288693"
    
    static func getMovieFromSearchTerm (searchTerm:String, completion:(movies: [MovieResult])->Void){
        var movieUrlString = MovieTitleSearchController.baseurl + "/search/movie"
        movieUrlString = movieUrlString + "?" + "api_key=" + MovieTitleSearchController.api_key
        movieUrlString = movieUrlString + "&" + "query=" + searchTerm
        
        if let url = NSURL(string: movieUrlString) {
            NetworkController.dataAtURL(String(url), completion: { (data) in
                if let data = data, let jsonDictionary = NetworkController.jsonWithReturn(data), let resultsArray = jsonDictionary["results"] as? [[String:AnyObject]] {
                    var movies = [MovieResult] ()
                    for resultDictionary in resultsArray{
                        if let movie = MovieResult(dictionary: resultDictionary) {
                            movies.append(movie)
                        }
                    }
                    completion(movies: movies)
                } else {
                    completion(movies: [])
                }
            })
            
        } else {
            completion(movies: [])
        }
    }
}
