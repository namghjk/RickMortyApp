//
//  RMCharacterInfoCollectionViewCellVM.swift
//  RMApiApp
//
//  Created by Nam Pham on 11/04/2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCellVM {
    public let type: `Type`
    private let value: String
    
    //MARK: -Format Date
    static let dateFormatter: DateFormatter = {
        //Format
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        //Format
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        return formatter
    }()
    
    //MARK:- Declare Variables
    public var title: String {
        self.type.displayTitle
    }
    
    public var displayValue: String {
        if value.isEmpty { return "None"}
        
        //        if type == .created {
        //            print("format: \(value)")
        //        }
        
        if let date = Self.dateFormatter.date(from: value),
           type == .created {
            return Self.shortDateFormatter.string(from: date)
        }
        return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor? {
        return type.tintColor
    }
    
    //MARK: -Declare variable type
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case created
        case location
        case episodeCount
        
        var tintColor: UIColor? {
            switch self {
            case .status :
                return .systemBlue
            case .gender :
                return .systemRed
            case .type :
                return .systemPurple
            case .species :
                return .systemGreen
            case .origin :
                return .systemPink
            case .created :
                return .systemIndigo
            case .location :
                return .systemMint
            case .episodeCount:
                return .systemBrown
                
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status :
                return UIImage(systemName: "bell")
            case .gender :
                return UIImage(systemName: "bell")
            case .type :
                return UIImage(systemName: "bell")
            case .species :
                return UIImage(systemName: "bell")
            case .origin :
                return UIImage(systemName: "bell")
            case .created :
                return UIImage(systemName: "bell")
            case .location :
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
                
            }
        }
        
        
        var displayTitle: String {
            switch self {
            case .status,.gender,.type,.species,.origin,.created,.location :
                return rawValue.uppercased()
                
            case .episodeCount:
                return "EPISODE COUNT"
                
            }
        }
    }
    
    
    //MARK: -Init
    init(type: `Type`,value: String) {
        self.value = value
        self.type = type
    }
    
}
