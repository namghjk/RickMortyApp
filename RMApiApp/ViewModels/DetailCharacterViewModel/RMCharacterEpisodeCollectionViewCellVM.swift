//
//  RMCharacterEpisodeCollectionViewCellVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 11/04/2023.
//

import UIKit

protocol RMEpisodeDataRender {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

final class RMCharacterEpisodeCollectionViewCellVM:Hashable, Equatable {
   
    private  let episodeDataURL: URL?
    private var isFetching = false
    private var dataBlock:((RMEpisodeDataRender) -> Void)?
    
    public let borderColor: UIColor
    
    private var episode : RMEpisode? {
        didSet{
            guard let model = episode else {
                return
            }
            dataBlock?(model)
        }
    }

    //MARK: - init
    init(episodeDataURL: URL?, borderColor: UIColor = .systemBlue) {
        self.episodeDataURL = episodeDataURL
        self.borderColor = borderColor
    }
    
    //MARK: - public
    
    public func registerForData(_ block: @escaping (RMEpisodeDataRender) -> Void){
        self.dataBlock = block
    }
    
    public func fetchEpisode() {
        
        guard !isFetching else {
            if let model = episode {
                dataBlock?(model)
            }
            return
        }
        
        guard let url = episodeDataURL, let request = RMRequest(url: url) else {
            return
        }
        
        isFetching = true
       
        RMService.shared.excute(request, expecting: RMEpisode.self) {
           [weak self]  result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model
                }
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.episodeDataURL?.absoluteString ?? "")
    }
    
    static func == (lhs: RMCharacterEpisodeCollectionViewCellVM, rhs: RMCharacterEpisodeCollectionViewCellVM) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
}
