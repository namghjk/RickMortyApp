//
//  RMDetailCharacterView.swift
//  RMApiApp
//
//  Created by Nam Pham on 27/03/2023.
//

import UIKit

//View for single character info
final class RMDetailCharacterView: UIView{
    
    private var collectionView: UICollectionView?
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    } ()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .purple
        
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        addSubview(collectionView,spinner)
        
        addConstraint()
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
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"cell")
        return collectionView
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection{
        
    }
    
    
    //
    //    public func fecthCharacterData(){
    //        print(requestUrl)
    //        guard let url = requestUrl,
    //              let request = RMRequest(url: url) else {
    //            print("Failed to create")
    //            return
    //        }
    //        RMService.shared.excute(request, expecting: RMCharacter.self) { result in
    //            switch result {
    //            case .success(let success):
    //                print(String(describing: success))
    //            case .failure(let failure):
    //                print(String(describing: failure))
    //            }
    //        }
}
