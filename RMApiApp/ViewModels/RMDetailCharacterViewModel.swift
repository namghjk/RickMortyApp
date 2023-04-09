//
//  RMDetailCharacterViewModel.swift
//  RMApiApp
//
//  Created by Nam Pham on 27/03/2023.
//

import Foundation

final class RMDetailCharacterViewModel{
    public let character: RMCharacter
    
    enum sectionType: CaseIterable {
        case photo
        case information
        case episodes
    }
    
    public let sections = sectionType.allCases
    
    //MARK: -Init
    
    init(character:RMCharacter){
        self.character = character
    }
    
    public var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title:String {
        character.name.uppercased()
    }
    
   
}
