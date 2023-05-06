//
//  RMSettingsCellViewVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 06/05/2023.
//

import UIKit

struct RMSettingsCellViewVM: Identifiable, Hashable {
    var id = UUID()
    

    private let type: RMSettingsOption
    
    //MARK: Init
    init(type: RMSettingsOption){
        self.type = type
    }
    
    //MARK: - Public
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    public var iconContainerColor: UIColor{
        return type.iconContainerColor
    }
}
