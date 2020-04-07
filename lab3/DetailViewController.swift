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
    
    
    var film: FilmMO?
    
    func configureView() {
        guard let film = film else { return }
        navigationBarTitle.title = film.title
        titleInput.text = film.title
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
}

