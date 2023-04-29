//
//  DetailEpisodeViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/04/2023.
//

import UIKit


/// This view show detail about single episode when customer click
class RMDetailEpisodeViewController: UIViewController {
    
    private let viewModel: RMDetailEpisodeViewVM
    
    private let detailView = RMDetailEpisodeView()
    
    //MARK: -init
    
    init(url: URL?){
        self.viewModel = .init(endPointUrl: url)
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
        addConstraint()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
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
    
}
