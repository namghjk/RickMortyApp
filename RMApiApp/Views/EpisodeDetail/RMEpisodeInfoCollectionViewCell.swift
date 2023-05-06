//
//  RMEpisodeInfoCollectionViewCell.swift
//  RMApiApp
//
//  Created by Nam Pham on 02/05/2023.
//

import UIKit

final class RMEpisodeInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "UICollectionViewCell"
    
    private let titleLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 20, weight: .medium)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

       private let valueLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 20, weight: .regular)
           label.textAlignment = .right
           label.numberOfLines = 0
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(titleLabel,valueLabel)
        setUpLayer()
        addConstaint()
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
   
    
    private func setUpLayer(){
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
    }
    
    private func addConstaint(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier:  0.47),
            
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            valueLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.47)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        titleLabel.text = nil
    }
    
    func configure(with viewModel: RMEpisodeInfoCollectionViewCellVM){
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
    }
}
