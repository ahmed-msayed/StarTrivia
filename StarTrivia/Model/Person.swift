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
    let homeworld: String
    let filmss: [String]
    let vehicles: [String]
    let starships: [String]
}

// Not necessary as it is allready matching in here
//enum CodingKeys: String, CodingKey {
//    case name
//    case height
//    case mass
//    case hairColor = "hair_color"
//    case birthYear = "birth_year"
//    case gender
//    case homeworld
//    case films
//    case vehicles
//    case starships
//}
