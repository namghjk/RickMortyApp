//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RMApiApp
//
//  Created by Nam Pham on 11/04/2023.
//

import UIKit

class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIndentifier = "RMCharacterEpisodeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        contentView.layer.cornerRadius = 9
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
    
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellVM ){
        viewModel.registerForData{ data in
            print(data.name)
            print(data.air_date)
            print(data.episode)
        }
        viewModel.fetchEpisode()
    }
}
