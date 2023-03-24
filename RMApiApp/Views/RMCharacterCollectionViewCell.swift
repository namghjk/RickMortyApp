//
//  RMCharacterCollectionViewCell.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/03/2023.
//

import UIKit

//Single cell for each character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    static let cellIndetifier = "RMCharacterCollectionViewCell"
    
    
    /// Configure Image View
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    /// Configure Name Label
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    /// Configure Status Label
    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = .systemFont(ofSize: 16, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(imageView,nameLabel,statusLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsopprted")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor,constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,constant: -3)
        ])
        
       
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    
    public func configure(with viewModel: RMCharacterCollectionViewCellModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
        
        
    }
}
