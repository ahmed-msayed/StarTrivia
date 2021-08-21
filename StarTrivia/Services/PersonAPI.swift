//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 20/08/2021.
//

import Foundation
import Alamofire

class PersonAPI {
    
//    func getRandomPersonUrlSession() {
//
//        guard let url = URL(string: Constants.PERSON_URL) else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//
//            //make sure error = nil and continue, else debug and won't continue
//            guard error == nil else {
//                debugPrint(error.debugDescription)
//                return
//            }
//
//            //unwrapping data "if let"
//            guard let data = data else { return }
//
//            do {
//                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
//                guard let json = jsonAny as? [String: Any] else { return }
//                print(json)
//            } catch {
//                debugPrint(error.localizedDescription)
//                return
//            }
    
////        }
//        task.resume()
    
    
    
//    }
    
    func getRandomPersonAlamofire() {
        
        guard let url = URL(string: Constants.PERSON_URL) else { return }

        AF.request(url).response { response in
            debugPrint(response)
            
            guard response.error == nil else {
                debugPrint(response.error.debugDescription)
                return
            }
            guard let result: Person = response.data?.getObject() else { return }
        }
    }
}
