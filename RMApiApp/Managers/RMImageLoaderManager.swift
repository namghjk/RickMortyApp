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
    
    /// Get Image Content with URL
    /// - Parameters:
    ///   - url: Source url
    ///   - completion: Callback
   public func downLoadImage(_ url: URL,completion: @escaping (Result<Data, Error>) -> Void){
       let key = url.absoluteString as NSString
       if let data = imageDataCache.object(forKey: key){
           completion(.success(data as Data)) //NSDATA ==data || NSString == String
           return
       }
       
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil  else{
                completion(.failure(error ?? URLError(.badURL)))
                return
            }
            let value = data as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            completion(.success(data))
        }
        task.resume()
    }
}
