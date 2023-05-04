//
//  RMDetailEpisodeViewVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 26/04/2023.
//

import Foundation

protocol RMDetailEpisodeViewVMDelegate: AnyObject{
    func didFetchEpisodeDetails()
}

final class RMDetailEpisodeViewVM {
    private let endPointUrl: URL?
    private var dataTuple: (episode: RMEpisode, characters: [RMCharacter])? {
        didSet{
            createCellViewModels()
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum sectionType{
        case information(viewModel: [RMEpisodeInfoCollectionViewCellVM])
        case characters(viewModel: [RMCharacterCollectionViewCellModel])
        
    }
    
    public weak var delegate: RMDetailEpisodeViewVMDelegate?
    
    public private(set) var cellViewModels: [sectionType] = []
    
    //MARK: - Init
    
    init(endPointUrl: URL?){
        self.endPointUrl = endPointUrl
    }
    
    //MARK: - Public
    
    
    //MARK: - Private
    
    private func createCellViewModels(){
        guard let  dataTuple = dataTuple else {
            return
        }
        
        let episode = dataTuple.episode
        let character = dataTuple.characters
        cellViewModels = [
            .information(viewModel: [
                .init(title: "Episode Name", value: episode.name),
                .init(title: "Air Date", value: episode.air_date),
                .init(title: "Episode", value: episode.episode),
                .init(title: "Created", value: episode.created)
            ]),
            .characters(viewModel: character.compactMap({ character in
                return RMCharacterCollectionViewCellModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImage: URL(string: character.image)
                )
            }))
        ]
    }
    
    /// Fetch backing episode model
    public func fetchEpisodeData(){
        guard let url = endPointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.excute(request, expecting: RMEpisode.self) {  [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case .failure:
                break
            }
        }
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode){
        let characterURLs = episode.characters.compactMap({
            return URL(string: $0)
        })
        let requests: [RMRequest] = characterURLs.compactMap({
            return RMRequest(url: $0)
        })
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.excute(request, expecting: RMCharacter.self) { result in
                defer{
                    group.leave()
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                     break
                }
            }
        }
        group.notify(queue: .main){
            self.dataTuple = (
                episode: episode,
                characters: characters
            )
        }
    }
}
