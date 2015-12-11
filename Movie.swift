//
//  Movie.swift
//  MyFavorites
//
//  Created by James Gobert on 12/9/15.
//  Copyright © 2015 EverydayDigitals. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

    func setMovieImg(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
