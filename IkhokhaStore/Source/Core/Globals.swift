//
//  Global.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/08.
//

import Foundation

// MARK: Global Functions

func localizedString(forKey key: String) -> String {
    var result = Bundle.main.localizedString(forKey: key, value: nil, table: nil)
    if result == key {
        result = Bundle.main.localizedString(forKey: key, value: nil, table: "AppStrings")
    }
    return result
}
