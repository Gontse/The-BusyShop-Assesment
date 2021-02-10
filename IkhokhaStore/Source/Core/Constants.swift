//
//  Constants.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/08.
//

import Foundation
import UIKit

// Using enums because they don't have init
enum UIConstants {
    static let height240: CGFloat = 240
}

enum CellIdentifiers {
    static let imageTableViewCell = "ImageCell"
    static let titleDetailTableViewCell = "TitleDetailCell"
    static let ImageTitleDescriptionTableViewCell = "ImageTitleDescriptionCell"
    static let ButtonTableViewCell = "ButtonCell"
}

enum AppUrl {
   static let imageBase = "gs://the-busy-shop.appspot.com"
}

enum AppCoreData {
    enum Model { static let products = "Products" }
    enum Entity { static let product = "Product" }
    enum Field {
        static let itemDescription = "itemdescription"
        static let price = "price"
    }
}
