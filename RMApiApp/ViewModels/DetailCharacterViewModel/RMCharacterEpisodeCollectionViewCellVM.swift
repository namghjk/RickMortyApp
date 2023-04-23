//
//  RMCharacterEpisodeCollectionViewCellVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 11/04/2023.
//

import Foundation

protocol RMEpisodeDataRender {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

final class RMCharacterEpisodeCollectionViewCellVM {
    private  let episodeDataURL: URL?
    private var isFetching = false
    private var dataBlock:((RMEpisodeDataRender) -> Void)?
    
    private var episode : RMEpisode? {
        didSet{
            guard let model = episode else {
                return
            }
            dataBlock?(model)
        }
    }

    //MARK: - init
    init(episodeDataURL: URL?) {
        self.episodeDataURL = episodeDataURL
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
    
}
