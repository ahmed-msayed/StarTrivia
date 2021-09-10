//
//  VehiclesAPI.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 10/09/2021.
//

import Foundation
import Alamofire

class VehiclesAPI {
    
    func getVehicles(url: String, completion: @escaping VehiclesResponseCompletion) {
        
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
                let vehicles = try jsonDecoder.decode(Vehicles.self, from: data)
                completion(vehicles)
            } catch {
                print(error)
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
}
