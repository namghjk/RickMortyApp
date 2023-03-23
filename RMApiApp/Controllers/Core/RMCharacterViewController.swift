//
//  RMCharacterViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 15/03/2023.
//

import UIKit


/// Controller to show and search Character
class RMCharacterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
    
        
        RMService.shared.excute(.listCharacterRequests, expecting: RMGetAllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: "+String( model.info.count))
                print("Page result count: "+String( model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
   

}
