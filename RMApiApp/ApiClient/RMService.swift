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
    ///   - type: the type of objcet w expect to get it
    ///   - completion: Call back with data or error message
    public func excute<T: Codable>(
        _ request: RMRequest,
        expectiong type: T.Type,
        completion: @escaping(Result<String,Error>) -> Void){
        
    }
}
