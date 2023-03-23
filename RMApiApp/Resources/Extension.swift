//
//  Extension.swift
//  RMApiApp
//
//  Created by Nam Pham on 23/03/2023.
//

import UIKit

extension UIView{
    func addSubview(_ views:UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
