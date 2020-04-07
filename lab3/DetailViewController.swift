//
//  DetailViewController.swift
//  lab3
//
//  Created by Marc PEREZ on 7/4/2020.
//  Copyright © 2020 Marc PEREZ. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet weak var navigationBarTitle: UINavigationItem!
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var directorInput: UITextField!
    @IBOutlet weak var ratingInput: UITextField!
    @IBOutlet weak var ratingStepper: UIStepper!
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var reviewInput: UITextField!
    
    @IBAction func onTitleChanged(_ sender: UITextField) {
        film?.title = sender.text
    }
    @IBAction func onDirectorChanged(_ sender: UITextField) {
        film?.director = sender.text
    }
    @IBAction func onWatchingDateChanged(_ sender: UIDatePicker) {
        film?.watchingDate = sender.date
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        guard let film = film else { return }
        film.rating = Int16(sender.value)
        ratingInput.text = String(film.rating)
    }
    @IBAction func onReviewChanged(_ sender: UITextField) {
        film?.review = sender.text
    }
    
    @IBAction func saveChangesButton(_ sender: UIButton) {
        saveFilm()
    }
    
    var film: FilmMO?
    var managedObjectContext: NSManagedObjectContext?

    func configureView() {
        guard let film = film else { return }
        navigationBarTitle.title = film.title
        titleInput.text = film.title
        directorInput.text = film.director
        ratingInput.text = String(film.rating)
        ratingStepper.value = Double(film.rating)
        if let watchingDate = film.watchingDate {
            dateInput.date = watchingDate
        }
        reviewInput.text = film.review
    }

    func createFilm() -> FilmMO {
        let newFilm = FilmMO(context: managedObjectContext!)
        // Set the default values
        newFilm.title = "TITLE"
        newFilm.director = "DIRECTOR"
        newFilm.rating = 5
        newFilm.watchingDate = Date()
        newFilm.review = "REVIEW"
        print("Initailised newFilm", newFilm)
        return newFilm
    }
    
    func saveFilm() {
        print("Saving the film")
        // Save the context.
        do {
            try managedObjectContext!.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if film == nil {
            film = createFilm()
        }
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Save before going back
        saveFilm()
    }
}

