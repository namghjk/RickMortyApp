//
//  RMService.swift
//  RMApiApp
//
//  Created by Nam Pham on 16/03/2023.
//

import Foundation

/// primary API service to get data on https://rickandmortyapi.com/
final class RMService{
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Constructor
    private init(){}
    
    /// Send API call
    /// - Parameters:
    ///   - request: request instance
    ///   - completion: Call back with data or error message
    public func excute(_ request: RMRequest,completion: @escaping() -> Void){
        
    }
}
