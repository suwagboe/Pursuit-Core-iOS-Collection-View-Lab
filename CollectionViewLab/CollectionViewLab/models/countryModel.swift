//
//  countryModel.swift
//  CollectionViewLab
//
//  Created by Pursuit on 1/14/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

typealias countryImage = String

struct Country: Codable {
    var name: String
    var alpha2Code: String
    var population: Int
  //  var flag: countryImage
    var currencies: [Currencies]
}

struct Currencies: Codable {
    var code: String
    var symbol: String
}
