//
//  StringExt.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 11/09/2021.
//

import Foundation

extension String {
    var lenghtTen: String {
        return String(self.prefix(10))
    }
    
    var lenghtTwelve: String {
        return String(self.prefix(12))
    }
    
    var lenghtTwenty: String {
        return String(self.prefix(20))
    }
}
