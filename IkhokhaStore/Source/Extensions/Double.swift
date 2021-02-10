//
//  Double.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/09.
//

import Foundation

extension Double {
    var asLocaleCurrency:String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: self))!
    }
}
