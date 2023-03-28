//
//  CharacterListViewModel.swift
//  RMApiApp
//
//  Created by Nam Pham on 23/03/2023.
//

import UIKit

protocol RMCharacterListViewModelDelegate: AnyObject{
    func didLoadInitialCharacters()
    func didSelectCharacter(_ characrer:RMCharacter)
}

/// ViewModel to handle CharacterListView
final class RMCharacterListViewModel: NSObject {
    
    public weak var delegate: RMCharacterListViewModelDelegate?
    
    private var characters: [RMCharacter] = []{
        didSet{
            for character in characters{
                let viewModel = RMCharacterCollectionViewCellModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImage: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [ RMCharacterCollectionViewCellModel] = []
    
    private var apiInfo :  RMGetAllCharacterResponse.Info? = nil
    
    /// Fetch initial 20 characters
    public func fetchCharacter() {
        RMService.shared.excute(.listCharacterRequests,
                                expecting: RMGetAllCharacterResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    //Paginate if we must to add more characters
    public func fetchAddditionalCharacters(){
        //Fetch Charactersfinal class RMDetailCharacterView
    }
    
    public var shouldShowLoadMoreIndicator: Bool {
           return apiInfo?.next != nil
       }
    
}

//MARK: -CollectionView

extension RMCharacterListViewModel: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIndetifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
       
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
        print("1")
    }
   
}


// MARK: -ScrollView
extension RMCharacterListViewModel: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator else {
            return
        }
    }
}
