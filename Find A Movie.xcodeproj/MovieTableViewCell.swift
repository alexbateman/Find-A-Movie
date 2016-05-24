//
//  MovieTableViewCell.swift
//  Find A Movie
//
//  Created by Alexander on 5/23/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

import UIKit

class MovieCustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func updatWithMovie(movie:MovieResult) {
        titleLabel.text = movie.title
        summaryLabel.text = movie.summary
        
        
        if let url = NSURL(string: movie.posterUrl) {
            if let data = NSData(contentsOfURL: url) {
                movieImage.image = UIImage(data: data)
            }
        }
    }
    
}
