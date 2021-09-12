//
//  FilmsAPI.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 12/09/2021.
//

import Foundation
import Alamofire

class FilmsAPI {
    
    func getFilms(url: String, completion: @escaping FilmsResponseCompletion) {
        
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
                let films = try jsonDecoder.decode(Films.self, from: data)
                completion(films)
            } catch {
                print(error)
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
}
