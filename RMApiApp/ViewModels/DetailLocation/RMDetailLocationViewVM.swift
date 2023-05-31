//
//  RMDetailLocationViewVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 31/05/2023.
//



import Foundation

protocol RMDetailLocationViewVMDelegate: AnyObject{
    func didFetchLocationDetails()
}

final class RMDetailLocationViewVM {
    private let endPointUrl: URL?
    private var dataTuple: (location: RMLocation, characters: [RMCharacter])? {
        didSet{
            createCellViewModels()
            delegate?.didFetchLocationDetails()
        }
    }
    
    enum sectionType{
        case information(viewModel: [RMLocationInfoCollectionViewCellVM])
        case characters(viewModel: [RMCharacterCollectionViewCellModel])
        
    }
    
    public weak var delegate: RMDetailLocationViewVMDelegate?
    
    public private(set) var cellViewModels: [sectionType] = []
    
    //MARK: - Init
    
    init(endPointUrl: URL?){
        self.endPointUrl = endPointUrl
    }
    
    public func character(at index: Int) -> RMCharacter?{
        guard let dataTuple = dataTuple else{
            return nil
        }
        return dataTuple.characters[index]
    }
    
    //MARK: - Public
    
    
    //MARK: - Private
    
    private func createCellViewModels(){
        guard let  dataTuple = dataTuple else {
            return
        }
        
        
        let location = dataTuple.location
        let character = dataTuple.characters
        
        var createdString = location.created
        if let createdDate = RMCharacterInfoCollectionViewCellVM.dateFormatter.date(from: location.created){
            createdString = RMCharacterInfoCollectionViewCellVM.shortDateFormatter.string(from: createdDate )
        }
        
        cellViewModels = [
            .information(viewModel: [
                .init(title: "Location Name", value: location.name),
                .init(title: "Dimension", value: location.dimension),
                .init(title: "Episode", value: location.type),
                .init(title: "Created", value: createdString)
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
        
        RMService.shared.excute(request, expecting: RMLocation.self) {  [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(location: model)
            case .failure:
                break
            }
        }
    }
    
    private func fetchRelatedCharacters(location: RMLocation){
        let characterURLs = location.residents.compactMap({
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
                location: location,
                characters: characters
            )
        }
    }
}
