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
    
    enum RMServiceError: Error{
        case failedToCreateRequest
        case failedToGetData
    }
    
    
    /// Send API call
    /// - Parameters:
    ///   - request: request instance
    ///   - type: the type of objcet w expect to get it
    ///   - completion: Call back with data or error message
    public func excute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping(Result<T,Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            // Decode Response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
                
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    //MARK: - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest?{
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
