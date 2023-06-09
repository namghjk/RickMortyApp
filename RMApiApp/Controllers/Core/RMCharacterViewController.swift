//
//  RMCharacterViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 15/03/2023.
//

import UIKit


/// Controller to show and search Character
class RMCharacterViewController: UIViewController,RMCharacterListViewDelegate {
    
    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
        addSearchButton()
    }
    
    private func addSearchButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc private func didTapSearch(){
        let  vc = RMSearchViewController(config: .init(type: .character))
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setUpView(){
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: -RMCharacter;istViewDelegate
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        //Open detail controller for that character
        let viewModel = RMDetailCharacterViewModel(character: character)
        let detailVC = RMDetailCharacterViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
