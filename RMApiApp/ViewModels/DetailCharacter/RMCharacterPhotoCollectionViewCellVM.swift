//
//  RMCharacterPhotoCollectionViewCellVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 11/04/2023.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellVM {
    private let imageURL: URL?
    
    init (imageURL: URL?) {
        self .imageURL = imageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data,Error>) -> Void) {
        guard let imageURL = imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoaderManager.shared.downLoadImage(imageURL, completion: completion)
    }
}
