//
//  CodableExt.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 21/08/2021.
//

import Foundation

extension Encodable {
    func encode() -> Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try? encoder.encode(self)
    }
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

extension Sequence {
    func getData() -> Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
    
    func getObject<T: Decodable>() -> T? {
        guard
            let data = self.getData() else { return nil }
        return data.getObject()
    }
}

extension UserDefaults {
    func saveObject<T: Codable>(rawData: T, forKey key: String) {
        do {
            let encoded = try JSONEncoder().encode(rawData)
            UserDefaults.standard.set(encoded, forKey: key)
        }
        catch {
            print(error)
        }
    }
    
    func getObject<T: Decodable>(key: String) -> T? {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return data.getObject()
    }
}

extension Data {
    func getObject<T: Decodable>() -> T? {
        do {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let parsedData = try decoder.decode(T.self, from: self)
            return parsedData
        }
        catch {
            //print(error)
        }
        return nil
    }
}

