//
//  TableView.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/09.
//

import UIKit

extension UITableView {
    func removeExtraCellLines() {
        tableFooterView = UIView(frame: .zero)
    }
}
