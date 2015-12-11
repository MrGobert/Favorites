//
//  DetailVC.swift
//  MyFavorites
//
//  Created by James Gobert on 12/9/15.
//  Copyright © 2015 EverydayDigitals. All rights reserved.
//

import UIKit
import CoreData

class DetailVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var bgImg: UIImageView!
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = movie.title
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        movieTitle.text = movie.title
        movieYear.text = movie.year
        movieGenre.text = movie.genre
        moviePlot.text = movie.plot
        movieImg.image = movie.getMovieImg()
        bgImg.image = movie.getMovieImg()
        
        movieImg.clipsToBounds = true
        bgImg.clipsToBounds = true

    
    }

 
    @IBAction func openIMDBLink(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: movie.imdb!)!)
    }
    

}
