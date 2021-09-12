//
//  Films.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 12/09/2021.
//

import Foundation

struct Films: Codable {
    let title: String
    let episode: Int
    let director: String
    let producer: String
    let release: String
    let crawl: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case director
        case producer
        case release = "release_date"
        case crawl = "opening_crawl"
    }
}
