//
//  ImageLoaderManager.swift
//  RMApiApp
//
//  Created by Nam Pham on 05/04/2023.
//

import Foundation

final class RMImageLoaderManager{
    static let shared = RMImageLoaderManager()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init() {}
    
   public func downLoadImage(_ url: URL,completion: @escaping (Result<Data, Error>) -> Void){
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil  else{
                completion(.failure(error ?? URLError(.badURL)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
