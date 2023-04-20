//
//  RMCharacterInfoCollectionViewCell.swift
//  RMApiApp
//
//  Created by Nam Pham on 11/04/2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIndentifier = "RMCharacterInfoCollectionViewCell"
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Earth"
        label.font = .systemFont(ofSize: 22, weight: .light)
        return label
    }()
    
    private let tittleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let iconImageView: UIImageView  = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "globe.asia.australia")
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    private let titleContainerView: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiarySystemBackground
        return view
    }()
    
    // MARK: -Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubview(valueLabel,iconImageView,titleContainerView)
        titleContainerView.addSubview(tittleLabel)
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            titleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            
            tittleLabel.leftAnchor.constraint(equalTo: titleContainerView.leftAnchor),
            tittleLabel.rightAnchor.constraint(equalTo: titleContainerView.rightAnchor),
            tittleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            tittleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 35),
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 20),
           
            valueLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor,constant: 10),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -10),
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 36),
            valueLabel.heightAnchor.constraint(equalToConstant:30),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        tittleLabel.text = nil
        iconImageView.image = nil
    }
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellVM ){
        
    }
}
