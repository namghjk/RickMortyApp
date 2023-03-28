//
//  RMDetailCharacterViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 27/03/2023.
//

import UIKit

class RMDetailCharacterViewController: UIViewController {
    private let viewModel: RMDetailCharacterViewModel

    
    init(viewModel: RMDetailCharacterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = viewModel.title

        
    }
    


}
