//
//  MovieResult.swift
//  Find A Movie
//
//  Created by Alexander on 5/23/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation
import UIKit

class MovieResult {
    
    private let movieImageBaseURl = "http://image.tmdb.org/t/p/w500"
    
    private let movieId = "id"
    private let movieSummary = "overview"
    private let movieTitle = "title"
    private let moviePosterPath = "poster_path"
    
    var id :Float
    var summary:String
    var title:String
    var posterUrl: String
    
    init? (dictionary: [String:AnyObject]) {
        guard let id = dictionary[movieId] as? Float,
        title = dictionary[movieTitle] as? String,
        summary = dictionary[movieSummary] as? String,
        posterPath = dictionary[moviePosterPath] as? String else {return nil}
        
        self.id = id
        self.title = title
        self.summary = summary
        self.posterUrl = movieImageBaseURl + posterPath
    }
}