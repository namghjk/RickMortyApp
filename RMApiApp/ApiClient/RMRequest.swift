//
//  RMRequest.swift
//  RMApiApp
//
//  Created by Nam Pham on 16/03/2023.
//

import Foundation

/// Objects represents a single API call
final class RMRequest{
    
    ///API Constant
    private struct Constants{
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    
    /// Desird Endpoint
    let endpoint: RMEndpoint
    
    /// Path components in API
    let pathComponents: [String]
    
    /// Query arguments for API
    let queryParameters: [URLQueryItem]
    
    //Constructed the URL for requesting API
    public var urlString:String{
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            //name=rick&status=alive
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
        
    }
    
    /// Final url
    public var url:URL?{
       return URL(string: urlString)
    }
    
    
    /// Desired http method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    
    /// Construct Request
    /// - Parameters:
    ///   - endpoint: Expected Endponit
    ///   - pathComponents: Collection of PathComponents
    ///   - queryParameters: Collection of QueryParameters
    init(endpoint: RMEndpoint,
         pathComponents:[String] = [],
         queryParameters:[URLQueryItem] = []
    ){
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
 

extension RMRequest{
    static let listCharacterRequests = RMRequest(endpoint: .character)
}
