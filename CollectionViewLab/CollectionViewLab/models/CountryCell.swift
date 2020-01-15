//
//  CountryCell.swift
//  CollectionViewLab
//
//  Created by Pursuit on 1/14/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit
import ImageKit

class CountryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var countryImageView: UIImageView!
    
    // to get the image i need to use the alpha2code ...
    // because I want to get the image from the link
    
    
    
    public func confifireCell(with countryImage: countryImage){
        // assigns image to variable
        countryImageView.getImage(with: countryImage) {
            [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.countryImageView.image = UIImage(systemName: "exclamationmark-triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.countryImageView.image = image
                }
            }
            
        }
        
    }
    
}
