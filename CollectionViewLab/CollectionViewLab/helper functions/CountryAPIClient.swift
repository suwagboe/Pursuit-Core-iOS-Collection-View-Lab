//
//  networkHelper.swift
//  CollectionViewLab
//
//  Created by Pursuit on 1/14/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation
import NetworkHelper

struct CountryAPIClient {
    
    static func fetchCountries(searchQuerey: String, completion: @escaping (Result<[Country], AppError>) ->() ){
        
        let countryEndpointURLString = "https://restcountries.eu/rest/v2/name/\(searchQuerey)"
        
        guard let url = URL(string: countryEndpointURLString) else {
            completion(.failure(.badURL(countryEndpointURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(.networkClientError(error)))
            case .success(let data):
                do{
                    // remember you need to an array
                    let result = try JSONDecoder().decode([Country].self, from: data)
                    
                    completion(.success(result))
                   // completion(.success(result.name))
                  //  completion(.success(result))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
            
        }
        
        
        
    }
    
}
