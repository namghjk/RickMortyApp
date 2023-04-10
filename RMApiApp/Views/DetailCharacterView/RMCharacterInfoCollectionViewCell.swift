//
//  RMCharacterInfoCollectionViewCell.swift
//  RMApiApp
//
//  Created by Nam Pham on 11/04/2023.
//

import UIKit

class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIndentifier = "RMCharacterInfoCollectionViewCell"
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
    
    private func configure(viewModel: RMCharacterInfoCollectionViewCellVM ){
        
    }
}
