//
//  RMDetailEpisodeView.swift
//  RMApiApp
//
//  Created by Nam Pham on 26/04/2023.
//

import UIKit

protocol RMDetailEpisodeViewDelegate: AnyObject{
    func rmdetailEpisodeView(
        _ detailEpisodeView:RMDetailEpisodeView ,
        didSelect character: RMCharacter
    )
}

final class RMDetailEpisodeView: UIView {
    
    public weak var delegate : RMDetailEpisodeViewDelegate?
    
    private var viewModel: RMDetailEpisodeViewVM? {
        didSet{
            spinner.stopAnimating()
            self.collectionView?.reloadData()
            self.collectionView?.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.collectionView?.alpha = 1
            }
        }
    }
    
    private var collectionView: UICollectionView?
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.color = .systemMint
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    //MARK: -Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        addSubview(collectionView,spinner)
        addConstraint()
        spinner.startAnimating()
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraint() {
        
        guard let collectionView = collectionView else {
            return
        }
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createCollectionView() -> UICollectionView{
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return self.layout(for:section)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RMEpisodeInfoCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMEpisodeInfoCollectionViewCell.cellIdentifier)
        collectionView.register(RMCharacterCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        return collectionView
    }
    
    
    //MARK: -public
    public func configure(with viewModel: RMDetailEpisodeViewVM){
        self.viewModel = viewModel
    }
}

extension RMDetailEpisodeView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sections = viewModel?.cellViewModels else {
            return 0
        }
        let sectionType = sections[section]
        
        switch sectionType {
        case .information(let viewModels):
            return viewModels.count
        case .characters(let viewModels):
            return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sections = viewModel?.cellViewModels else {
            fatalError("No ViewModel")
        }
        let sectionType = sections[indexPath.section]
        
        switch sectionType {
        case .information(let viewModels):
            let cellViewModel = viewModels[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:RMEpisodeInfoCollectionViewCell.cellIdentifier,for: indexPath
            ) as? RMEpisodeInfoCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: cellViewModel)
            return cell
        case .characters(let viewModels):
            let cellViewModel = viewModels[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:RMCharacterCollectionViewCell.cellIdentifier,for: indexPath
            ) as? RMCharacterCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: cellViewModel)
            return cell
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else{
            return
        }
        let sections = viewModel.cellViewModels
        let sectionType = sections[indexPath.section]
    
        switch sectionType {
        case .information:
            break
        case .characters:
            guard let character = viewModel.character(at:indexPath.row) else {
                return 
            }
            delegate?.rmdetailEpisodeView(self, didSelect: character)
            
        }
    }
    
}


extension RMDetailEpisodeView {
    private func layout(for section: Int) -> NSCollectionLayoutSection{
        guard let sections = viewModel?.cellViewModels else{
            return createInfoLayout()
        }
        switch sections[section]{
        case .information:
            return createInfoLayout()
        case .characters:
            return createCharacterLayout()
        }
    }
    
    private func createInfoLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        ))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(80)),
                                                     subitems:[item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func createCharacterLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                     leading: 10,
                                                     bottom: 5,
                                                     trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(260)),subitems: [item,item]
        )
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}
