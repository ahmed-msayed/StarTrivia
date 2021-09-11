//
//  StarshipsAPI.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 11/09/2021.
//

import Foundation
import Alamofire

class StarshipsAPI {
    
    func getStarships(url: String, completion: @escaping StarshipsResponseCompletion) {
        
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
                let starships = try jsonDecoder.decode(Starships.self, from: data)
                completion(starships)
            } catch {
                print(error)
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
}
