//
//  RMDetailCharacterViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 27/03/2023.
//

import UIKit

class RMDetailCharacterViewController: UIViewController {
    
    private let viewModel: RMDetailCharacterViewModel
    
    private let detailView: RMDetailCharacterView
    
    
    
    init(viewModel: RMDetailCharacterViewModel) {
        self.viewModel = viewModel
        self.detailView = RMDetailCharacterView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare)
        )
        addConstraint()
        
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
    }
    
    @objc
    private func didTapShare(){
        //Share character info
    }
    
    private func addConstraint(){
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
 }


//MARK: -CollectionView
extension RMDetailCharacterViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        if indexPath.section == 0{
            cell.backgroundColor = .green
        } else if indexPath.section == 1{
            cell.backgroundColor = .systemBlue
        } else {
            cell.backgroundColor = .cyan
        }
        return cell
    }
    
    

}
