//
//  ViewController.swift
//  CollectionViewLab
//
//  Created by Pursuit on 1/14/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var selectedCountry = [Country]() {
        didSet{
            
        }
}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .purple
    }
    
    

    

}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return selectedCountry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            fatalError("the cell is not properly dequed")
        }
        
        let country = selectedCountry[indexPath.row]
        
        cell.confifireCell(with: country.flag)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing = 10
        
        let maxWidth = UIScreen.main.bounds.size.width
        
        let numberOfItem: CGFloat = 3
        
        let totalSpacing: CGFloat = numberOfItem * CGFloat(interItemSpacing)
        
        let itemWidth = (maxWidth - totalSpacing) / numberOfItem
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
}
