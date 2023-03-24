//
//  RMCharacterCollectionViewCellModel.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/03/2023.
//

import Foundation


final class RMCharacterCollectionViewCellModel {
    
    public let characterName: String
    private let characterStatus:RMStatus
    private let characterImageURL:URL?
    
    init(
        characterName: String,
        characterStatus:RMStatus,
        characterImage:URL?
    ) {
        self.characterImageURL = characterImage
        self.characterName = characterName
        self.characterStatus = characterStatus
    }
    
    public var characterStatusText: String{
        return characterStatus.rawValue
    }
    
    public func fetchImage(completion:@escaping (Result<Data, Error>) -> Void){
        
        //TODO: Abstract to Imgage Manager
        guard let url = characterImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
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
