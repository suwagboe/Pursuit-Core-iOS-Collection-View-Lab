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
    
    static func fetchCountries(completion: @escaping (Result<[String], AppError>) ->() ){
        
        let countryEndpointURLString = "https://restcountries.eu/rest/v2/name/united"
        
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
                    let result = try JSONDecoder().decode(Country.self, from: data)
                    
                   // completion(.success(result.name))
                  //  completion(.success(result))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
            
        }
        
        
        
    }
    
}
