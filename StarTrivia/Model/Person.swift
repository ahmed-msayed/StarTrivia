//
//  Person.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 21/08/2021.
//

import Foundation

struct Person: Codable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let birthYear: String
    let gender: String
    let homeworldUrl: String
    let filmUrls: [String]
    let vehicleUrls: [String]
    let starshipUrls: [String]
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldUrl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
}



