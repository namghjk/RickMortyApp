//
//  RMLocationTableViewCellVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 24/05/2023.
//

import Foundation

struct RMLocationTableViewCellVM: Hashable, Equatable {
    
    private let location: RMLocation
    
    init(location: RMLocation){
        self.location = location
    }
    
    public var name: String{
        return location.name
    }
    
    public var type: String{
        return "type: "+location.type
    }
    
    public var dimension: String{
        return location.dimension
    }
    
    static func == (lhs: RMLocationTableViewCellVM, rhs: RMLocationTableViewCellVM) -> Bool {
        return lhs.location.id == rhs.location.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(location.id)
        hasher.combine(dimension)
        hasher.combine(type)
    }
    
}
