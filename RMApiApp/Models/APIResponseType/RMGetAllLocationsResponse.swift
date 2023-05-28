//
//  RMGetAllLocationsResponse.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/05/2023.
//

import Foundation

struct  RMGetAllLocationsResponse: Codable {
    struct Info:Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMLocation]
}
