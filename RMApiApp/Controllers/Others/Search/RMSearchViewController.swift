//
//  RMSearchViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 29/04/2023.
//

import UIKit

/// Config controller to Search
final class RMSearchViewController: UIViewController {
    
    /// Configuration for search session
    struct Config {
        enum `Type` {
            case character //name|status|gender
            case episode // name|episode code
            case location // name|type|dimension
        }
        let type: `Type`
    }
    
    private let congfig: Config
    
    init(config:Config) {
        self.congfig = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
    }
    


}
