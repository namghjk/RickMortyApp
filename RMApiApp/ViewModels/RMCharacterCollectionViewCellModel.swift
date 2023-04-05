//
//  RMCharacterCollectionViewCellModel.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/03/2023.
//

import Foundation


final class RMCharacterCollectionViewCellModel:Hashable {
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
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion:@escaping (Result<Data, Error>) -> Void){
        
        //TODO: Abstract to Imgage Manager
        guard let url = characterImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        RMImageLoaderManager.shared.downLoadImage(url, completion: completion)
    }
    //MARK: - Hashable
    
    static func == (lhs: RMCharacterCollectionViewCellModel, rhs: RMCharacterCollectionViewCellModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    

    func hash (into hasher: inout Hasher){
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageURL)
    }
    
}
