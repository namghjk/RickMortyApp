//
//  RMSettingsOtion.swift
//  RMApiApp
//
//  Created by Nam Pham on 06/05/2023.
//

import UIKit

enum RMSettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case viewSeries
    case viewCode
    
    var displayTitle: String{
        switch self {
        case .rateApp:
            return "rateApp"
        case .contactUs:
            return "contactUs"
        case .terms:
            return "terms"
        case .privacy:
            return "privacy"
        case .apiReference:
            return "apiReference"
        case .viewSeries:
            return "viewSeries"
        case .viewCode:
            return "viewCode"
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemBlue
        case .contactUs:
            return .systemRed
        case .terms:
            return .systemPink
        case .privacy:
            return .systemOrange
        case .apiReference:
            return .systemPurple
        case .viewSeries:
            return .systemMint
        case .viewCode:
            return .systemCyan
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .privacy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "list.clipboard")
        case .viewSeries:
            return UIImage(systemName: "tv.fill")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
}
