//
//  RMDetailCharacterViewModel.swift
//  RMApiApp
//
//  Created by Nam Pham on 27/03/2023.
//

import Foundation

final class RMDetailCharacterViewModel{
    public let character: RMCharacter
    
    init(character:RMCharacter){
        self.character = character
    } 
    
    public var title:String {
        character.name.uppercased()
    }
}
