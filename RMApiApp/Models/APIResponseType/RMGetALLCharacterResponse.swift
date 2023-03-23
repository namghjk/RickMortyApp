//
//  RMGetALLCharacterResponse.swift
//  RMApiApp
//
//  Created by Nam Pham on 23/03/2023.
//

import Foundation


struct RMGetAllCharacterResponse: Codable{
    struct Info:Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}

