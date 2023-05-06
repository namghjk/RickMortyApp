//
//  RMSettingsViewController.swift
//  RMApiApp
//
//  Created by Nam Pham on 15/03/2023.
//

import UIKit

/// Controller to show Setting
class RMSettingsViewController: UIViewController {
    
    private let viewModel = RMSettingsViewVM(cellViewModles: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewVM(type: $0)
        })
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
    }   
}
