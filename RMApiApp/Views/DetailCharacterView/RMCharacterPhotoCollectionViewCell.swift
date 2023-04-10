//
//  RMCharacterPhotoCollectionViewCell.swift
//  RMApiApp
//
//  Created by Nam Pham on 11/04/2023.
//

import UIKit

final class RMCharacterPhotoCollectionViewCell: UICollectionViewCell {
    
    static let cellIndentifier = "RMCharacterPhotoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func configure(viewModel: RMCharacterPhotoCollectionViewCellVM ){
        
    }
    
}
