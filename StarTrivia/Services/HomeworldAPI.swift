//
//  HomeworldAPI.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 01/09/2021.
//

import Foundation
import Alamofire

class HomeworldAPI {
    
    
    func getHomeworld(url: String, completion: @escaping HomeworldesponseCompletion) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }

            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch {
                print(error)
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
    
}
