//
//  RMDetailEpisodeViewVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 26/04/2023.
//

import Foundation

class RMDetailEpisodeViewVM {
    private let endPointUrl: URL?
    
    init(endPointUrl: URL?){
        self.endPointUrl = endPointUrl
    }
    
    private func fetchEpisodeData(){
        guard let url = endPointUrl, let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.excute(request, expecting: RMEpisode.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success))
            case .failure(let failure):
                break
            }
        }
    }
}
