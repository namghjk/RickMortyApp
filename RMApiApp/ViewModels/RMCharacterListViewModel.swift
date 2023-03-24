//
//  CharacterListViewModel.swift
//  RMApiApp
//
//  Created by Nam Pham on 23/03/2023.
//

import UIKit

final class RMCharacterListViewModel: NSObject {
    func fetchCharacter() {
        RMService.shared.excute(.listCharacterRequests, expecting: RMGetAllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example image url: "+String( model.results.first?.image ?? "No image"))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewModel: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIndetifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        let viewModel = RMCharacterCollectionViewCellModel(
            characterName: "CABSCHB",
            characterStatus: .alive,
            characterImage: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.")
        )
        
        cell.configure(with: viewModel)

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
    
    
    
}
