//
//  RMLocationViewVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 10/05/2023.
//

import Foundation

final class RMLocationViewVM {
    
    private var locations: [RMLocation] = []
    //Location response info
    //Will contain next URL, if present
    init(){}
    
    public func fetchLocation(){
        let request = RMRequest(endpoint: .location)
        RMService.shared.excute(request, expecting: RMLocation.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    private var hasMoreResults: Bool{
        return false
    }
}
