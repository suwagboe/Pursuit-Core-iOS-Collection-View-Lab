//
//  DetailViewController.swift
//  CollectionViewLab
//
//  Created by Pursuit on 1/15/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageOfCountry: UIImageView!
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
        
        //thing.alpha2Code
        
        
        // how does the image work again
        
        imageOfCountry.getImage(with: "https://www.countryflags.io/\(thing.alpha2Code)/flat/64.png", completion: {
              [weak self] result in
              switch result {
              case .failure:
                  DispatchQueue.main.async {
                      self?.imageOfCountry.image = UIImage(systemName: "exclamationmark-triangle")
                  }
              case .success(let image):
                  DispatchQueue.main.async {
                    self?.imageOfCountry.image = image
                }
              }
              
          })
        

    }
   

}
