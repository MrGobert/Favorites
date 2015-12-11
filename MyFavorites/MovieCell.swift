//
//  MovieCell.swift
//  MyFavorites
//
//  Created by James Gobert on 12/9/15.
//  Copyright © 2015 EverydayDigitals. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var cellBgImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImg.layer.cornerRadius = 5.0
        movieImg.clipsToBounds = true
        cellBgImg.clipsToBounds = true
        
    }
    
    func configureCell(movie: Movie) {
        movieTitle.text = movie.title
        movieGenre.text = movie.genre
        movieYear.text = movie.year
        movieImg.image = movie.getMovieImg()
        cellBgImg.image = movie.getMovieImg()
    }


}
