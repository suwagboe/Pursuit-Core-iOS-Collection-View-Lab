//
//  DetailViewController.swift
//  CollectionViewLab
//
//  Created by Pursuit on 1/15/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencySignLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    
    var actualCountry: Country?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData(){
        
        guard let thing = actualCountry else {
            fatalError("the data form the country did not properly pass")
        }
        populationLabel.text = "The populatino is: \(thing.population)"
        currencySignLabel.text = thing.currencies.first?.code
        countryNameLabel.text = thing.name
        
        
        
        
        // how does the image work again
        // image.image =
        
    }

   

}
