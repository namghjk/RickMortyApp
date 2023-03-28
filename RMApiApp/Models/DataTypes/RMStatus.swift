//
//  RMStatus.swift
//  RMApiApp
//
//  Created by Nam Pham on 17/03/2023.
//

import Foundation

enum RMStatus: String,Codable{
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String{
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}


