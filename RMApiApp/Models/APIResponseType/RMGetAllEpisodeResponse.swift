//
//  RMGetAllEpisodeResponse.swift
//  RMApiApp
//
//  Created by Nam Pham on 29/04/2023.
//

import Foundation

struct RMGetAllEpisodeResponse: Codable {
    struct Info:Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMEpisode]
}
