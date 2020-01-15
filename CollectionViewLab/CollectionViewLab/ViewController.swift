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
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var selectedCountry = [Country]() {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .purple
        getCountry()
        searchBar.delegate = self
    }
    
    private func getCountry(){
        
        CountryAPIClient.fetchCountries(completion: { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("couldn't get the data \(appError)")
            case .success(let country):
                self?.selectedCountry = country
            }
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? DetailViewController, let indexPath = collectionView.indexPathsForSelectedItems?.first
            else {
            fatalError("couldnt segure properly")
        }
        let selected = selectedCountry[indexPath.row]
        
        dvc.actualCountry = selected
        
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text else {
            return
        }
        
        
        
        searchBar.resignFirstResponder()
        
        
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
        
        cell.confifireCell(with: country.alpha2Code)
        
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
