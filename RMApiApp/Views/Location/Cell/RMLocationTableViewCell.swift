//
//  RMLocationTableViewCell.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/05/2023.
//

import UIKit

final class RMLocationTableViewCell: UITableViewCell {
    static let cellIdentifier = "RMLocationTableViewCell"
    
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 20,weight: .bold)
        return nameLabel
    }()
    
    private var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = .systemFont(ofSize: 15,weight: .regular)
        typeLabel.textColor = .secondaryLabel
        return typeLabel
    }()
    
    private var dimensionLabel: UILabel = {
        let dimensionLabel = UILabel()
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        dimensionLabel.font = .systemFont(ofSize: 15,weight: .light)
        dimensionLabel.textColor = .secondaryLabel
        return dimensionLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel,typeLabel,dimensionLabel)
        addConstraint()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraint(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            typeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            typeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            
            dimensionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            dimensionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            dimensionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            dimensionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        typeLabel.text = nil
        dimensionLabel.text = nil
    }
    
    public func configure(with viewModel: RMLocationTableViewCellVM){
        nameLabel.text = viewModel.name
        typeLabel.text = viewModel.type
        dimensionLabel.text = viewModel.dimension
    }
}
