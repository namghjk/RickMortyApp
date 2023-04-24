//
//  DetailEpisodeViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/04/2023.
//

import UIKit


/// This view show detail about single episode when customer click
class RMDetailEpisodeViewController: UIViewController {
    
    private let url: URL?
    
    
    //MARK: -init
    
    init(url: URL?){
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .secondarySystemBackground
    }
    

}
