//
//  DetailViewController.swift
//  lab3
//
//  Created by Marc PEREZ on 7/4/2020.
//  Copyright © 2020 Marc PEREZ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if film != nil {
            if let label = detailDescriptionLabel {
                label.text = film?.title
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var film: FilmMO? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

