//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 20/08/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonAPI {
    
    //web request using UrlSession
    //    func getRandomPersonUrlSession(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //        guard let url = URL(string: "\(Constants.PERSON_URL)\(id)") else { return }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //
    //            //make sure error = nil and continue, else debug and won't continue
    //            guard error == nil else {
    //                debugPrint(error.debugDescription)
    //                completion(nil)
    //                return
    //            }
    //
    //            //unwrapping data "if let"
    //            guard let data = data else { return }
    //
    //            do {
    //                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
    //                guard let json = jsonAny as? [String: Any] else { return }
    //                let person = self.parsePersonManual(json: json)
    //
    //                DispatchQueue.main.async {  //to get back to main thread to deal with UI items
    //                    completion(person)
    //                }
    //
    //            } catch {
    //                debugPrint(error.localizedDescription)
    //                return
    //            }
    //        }
    //        task.resume()
    //    }
    
    //parsing manually
    //    private func parsePersonManual (json: [String: Any]) -> Person {
    //        let name = json["name"] as? String ?? ""            // if fails, set value to ""
    //        let height = json["height"] as? String ?? ""
    //        let mass = json["mass"] as? String ?? ""
    //        let hair = json["hair_color"] as? String ?? ""
    //        let birthYear = json["birth_year"] as? String ?? ""
    //        let gender = json["gender"] as? String ?? ""
    //        let homeworldUrl = json["homeworld"] as? String ?? ""
    //        let filmUrls = json["films"] as? [String] ?? [String]()
    //        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
    //        let starshipUrls = json["starships"] as? [String] ?? [String]()
    //
    //        let person = Person(name: name, height: height, mass: mass, hairColor: hair, birthYear: birthYear, gender: gender, homeworld: homeworldUrl, films: filmUrls, vehicles: vehicleUrls, starships: starshipUrls)
    //
    //        return person
    //    }
    
    
    
    //Web request with Alamofire mostafa
    //    func getRandomPersonAlamofireMost(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //        guard let url = URL(string: "\(Constants.PERSON_URL)\(id)") else { return }
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
    
    
    //Web request with Alamofire
    //    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //        guard let url = URL(string: "\(Constants.PERSON_URL)\(id)") else { return }
    //        AF.request(url).responseJSON { response in
    //            if let error = response.error {
    //                debugPrint(error.localizedDescription)
    //                completion(nil)
    //                return
    //            }
    //            guard let json = response.value as? [String: Any] else {
    //                return completion(nil)
    //            }
    //            let person = self.parsePersonManual(json: json)
    //            completion(person)
    //        }
    //    }
    
    
    //Web request with Alamofire and SwiftyJSON
    //    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //        guard let url = URL(string: "\(Constants.PERSON_URL)\(id)") else { return }
    //        AF.request(url).responseJSON { response in
    //            if let error = response.error {
    //                debugPrint(error.localizedDescription)
    //                completion(nil)
    //                return
    //            }
    //            guard let data = response.data else { return completion(nil) }
    //            do {
    //                let json = try JSON(data: data)
    //                let person = self.parsePersonSwifty(json: json)
    //                completion(person)
    //            } catch {
    //                debugPrint(error.localizedDescription)
    //                completion(nil)
    //            }
    //        }
    //    }
    
    //parsing using SwiftyJSON
    //    private func parsePersonSwifty (json: JSON) -> Person {
    //        let name = json["name"].stringValue          // if fails, set value to ""
    //        let height = json["height"].stringValue
    //        let mass = json["mass"].stringValue
    //        let hair = json["hair_color"].stringValue
    //        let birthYear = json["birth_year"].stringValue
    //        let gender = json["gender"].stringValue
    //        let homeworldUrl = json["homeworld"].stringValue
    //        let filmUrls = json["films"].arrayValue.map({$0.stringValue})
    //        let vehicleUrls = json["vehicles"].arrayValue.map({$0.stringValue})
    //        let starshipUrls = json["starships"].arrayValue.map({$0.stringValue})
    //
    //        let person = Person(name: name, height: height, mass: mass, hairColor: hair, birthYear: birthYear, gender: gender, homeworld: homeworldUrl, films: filmUrls, vehicles: vehicleUrls, starships: starshipUrls)
    //
    //        return person
    //    }
    
    
    
    //Web request with Alamofire and Codable + CodableExt
    //    func getRandomPersonAlamofireMost(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //        guard let url = URL(string: "\(Constants.PERSON_URL)\(id)") else { return }
    //        AF.request(url).responseJSON { response in
    //            if let error = response.error {
    //                debugPrint(error.localizedDescription)
    //                completion(nil)
    //                return
    //            }
    //            guard let data = response.data else { return completion(nil) }
    //                let person: Person? = data.getObject()
    //                completion(person)
    //        }
    //    }
    
    
    
    //Web request with Alamofire and Codable
    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(Constants.PERSON_URL)\(id)") else { return }
        AF.request(url).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }

            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                print(error)
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
