//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 20/08/2021.
//

import Foundation
import Alamofire

class PersonAPI {
    
    func getRandomPersonUrlSession() {
        
        guard let url = URL(string: Constants.PERSON_URL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            //make sure error = nil and continue, else debug and won't continue
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            
            //unwrapping data "if let"
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                print(person.name)
                print(person.birthYear) //etc.
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
            
        }
        task.resume()
    }
    
    private func parsePersonManual (json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? ""            // if fails, set value to ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        let person = Person(name: name, height: height, mass: mass, hairColor: hair, birthYear: birthYear, gender: gender, homeworld: homeworldUrl, films: filmUrls, vehicles: vehicleUrls, starships: starshipUrls)
        
        return person
    }
    
    //    func getRandomPersonAlamofire() {
    //
    //        guard let url = URL(string: Constants.PERSON_URL) else { return }
    //
    //        AF.request(url).response { response in
    //            debugPrint(response)
    //
    //            guard response.error == nil else {
    //                debugPrint(response.error.debugDescription)
    //                return
    //            }
    //            guard let result: Person = response.data?.getObject() else { return }
    //        }
    //    }
}
