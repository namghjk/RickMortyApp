//
//  DetailEpisodeViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/04/2023.
//

import UIKit


/// This view show detail about single episode when customer click
class RMDetailEpisodeViewController: UIViewController, RMDetailEpisodeViewVMDelegate,RMDetailEpisodeViewDelegate {
    
    private let viewModel: RMDetailEpisodeViewVM
    
    private let detailView = RMDetailEpisodeView()
    
    //MARK: -init
    
    init(url: URL?){
        self.viewModel = RMDetailEpisodeViewVM(endPointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.addSubview(detailView)
        detailView.delegate = self
        addConstraint()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        viewModel.delegate = self
        viewModel.fetchEpisodeData()
         
    }
    
    private func addConstraint(){
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc
    private func didTapShare(){
        
    }
 
    //MARK: - Delegate
    func didFetchEpisodeDetails() {
        detailView.configure(with: viewModel)
    }
    
    func rmdetailEpisodeView(_ detailEpisodeView: RMDetailEpisodeView, didSelect character: RMCharacter) {
        let vc = RMDetailCharacterViewController(viewModel: .init(character: character))
        navigationController?.pushViewController(vc, animated: true
        )
    }
    
    
    
}
