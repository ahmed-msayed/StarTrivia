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
    let films: [String]
    let vehicles: [String]
    let starships: [String]
}

//data bag that will hold data coming from JSON
