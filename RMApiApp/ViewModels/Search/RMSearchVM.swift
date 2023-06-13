//
//  RMSearchVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 13/06/2023.
//

import Foundation

//Responsibilities
// - Show search results
// - show no results view
// - kick off api request

final class RMSearchVM {
    let config: RMSearchViewController.Config
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
}
