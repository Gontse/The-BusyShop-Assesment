//
//  IMainCoordinator.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/08.
//

import Foundation


protocol IMainCoordinator {
    func showSignIn()
    func showMainMenu()
    func PresentItemDetail(_ productItem: ProductItem)
}
