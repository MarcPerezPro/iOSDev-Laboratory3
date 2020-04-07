//
//  DetailViewController.swift
//  lab3
//
//  Created by Marc PEREZ on 7/4/2020.
//  Copyright © 2020 Marc PEREZ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var navigationBarTitle: UINavigationItem!
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var directorInput: UITextField!
    @IBOutlet weak var ratingInput: UITextField!
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var reviewInput: UITextView!

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    var film: FilmMO?
    
    func configureView() {
        guard let film = film else { return }
        navigationBarTitle.title = film.title
        titleInput.text = film.title
        directorInput.text = film.director
        ratingInput.text = String(film.rating)
        if let watchingDate = film.watchingDate {
            dateInput.date = watchingDate
        }
        reviewInput.text = film.review
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
}

