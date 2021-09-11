//
//  Starships.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 11/09/2021.
//

import Foundation

struct Starships: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let speed: String
    let crew: String
    let passengers: String
    let cargo: String
    let consumables: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargo = "cargo_capacity"
        case consumables
        case category = "starship_class"
    }
}
