//
//  RMEndpoint.swift
//  RMApiApp
//
//  Created by Nam Pham on 16/03/2023.
//

import Foundation

/// unique API endpoint
@frozen enum RMEndpoint: String, Hashable, CaseIterable {
   /// endpoint for Character info call
   case character //"character"
    
   /// endpoint for location info call
   case location //"location"
    
   /// endpoint for episode info call
   case episode //"episode"
}
