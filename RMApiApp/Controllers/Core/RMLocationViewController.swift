//
//  RMLocationViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 15/03/2023.
//

import UIKit

/// Controller to show and search Location
class RMLocationViewController: UIViewController, RMLocationViewVMDelegate,RMLocationViewDelegate {
    
    private let primaryView = RMLocationView()
    
    private let viewModel = RMLocationViewVM()
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        primaryView.delegate = self
        view.addSubview(primaryView)
        view.backgroundColor = .systemBackground
        
        title = "Location"
        addSearchButton()
        addConstaint()
        viewModel.delegate = self
        viewModel.fetchLocation()
    }
    private func addSearchButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    private func  addConstaint(){
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func didTapSearch(){
        let vc = RMSearchViewController(config: .init(type: .location))
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: -LocationViewDelegate
    func rmLocationViewDelegate(_ locationView: RMLocationView, didSelect location: RMLocation) {
        let vc = RMDetailLocationViewController(location: location)
        vc.navigationItem.largeTitleDisplayMode = .never
         navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - LocationVM Delegate
    func didFetchInitialLocations() {
        primaryView.configure(with: viewModel)
    }
    
   
    
   
    
    
}
