//
//  RMLocationViewVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 10/05/2023.
//

import Foundation

protocol RMLocationViewVMDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewVM {
    
    weak var delegate: RMLocationViewVMDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet{
            for location in locations {
                let cellViewModel = RMLocationTableViewCellVM(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    //Location response info
    //Will contain next URL, if present
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public private(set) var cellViewModels: [RMLocationTableViewCellVM] = []
    
    init(){}
    
    public func location(at index: Int) -> RMLocation?{
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return self.locations[index]
    }
    
    public func fetchLocation(){
        let request = RMRequest(endpoint: .location)
        RMService.shared.excute(request, expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure(let failure):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool{
        return false
    }
}

