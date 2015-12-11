//
//  AddMovieVC.swift
//  MyFavorites
//
//  Created by James Gobert on 12/9/15.
//  Copyright © 2015 EverydayDigitals. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieYear: UITextField!
    @IBOutlet weak var movieGenre: UITextField!
    @IBOutlet weak var moviePlot: UITextField!
    @IBOutlet weak var imdbLink: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add A Movie"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 5.0
        movieImg.clipsToBounds = true
     
    }
    
    //Functions to dismiss keyboard
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Image picker function

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }

    @IBAction func addImage(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addMovie(sender: AnyObject) {
        if let title = movieTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = title
            movie.year = movieYear.text
            movie.genre = movieGenre.text
            movie.plot = moviePlot.text
            movie.imdb = imdbLink.text
            movie.setMovieImg(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Failed To Save Movie")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }
    }
    
}
