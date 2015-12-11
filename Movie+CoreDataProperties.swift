//
//  Movie+CoreDataProperties.swift
//  MyFavorites
//
//  Created by James Gobert on 12/9/15.
//  Copyright © 2015 EverydayDigitals. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var genre: String?
    @NSManaged var year: String?
    @NSManaged var plot: String?
    @NSManaged var imdb: String?

}
