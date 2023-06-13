//
//  RMSearchView.swift
//  RMApiApp
//
//  Created by Nam Pham on 10/06/2023.
//

import UIKit

class RMSearchView: UIView {

    private let viewModel: RMSearchVM
    
    //MARK: -subviews
    
    //search input view(bar, selection button
    
    //No results view
    
    //Result collectionView
    
    //MARK: -init
    init(frame: CGRect, viewModel: RMSearchVM) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}


//MARK: - CollectionView
extension RMSearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}
