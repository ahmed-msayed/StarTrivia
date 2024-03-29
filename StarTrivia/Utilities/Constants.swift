//
//  Constants.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 20/08/2021.
//

import UIKit

class Constants {
    static let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

    static let URL_BASE = "https://swapi.dev/api/"
    static let PERSON_URL = URL_BASE + "people/"
    
}

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
typealias VehiclesResponseCompletion = (Vehicles?) -> Void
typealias StarshipsResponseCompletion = (Starships?) -> Void
typealias FilmsResponseCompletion = (Films?) -> Void
