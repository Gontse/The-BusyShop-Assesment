//
//  MainCoordinator.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/03.
//
import UIKit
import Foundation

class MainCoordinator: IMainCoordinator {
    private let navigationController = UINavigationController()
    var rootViewController : UIViewController { navigationController }
    
    func start() { showSignIn() }
    
     func showSignIn() {
        let signInViewController = SignInViewController.instantiate()
        navigationController.pushViewController(signInViewController, animated: true)
        
        signInViewController.didSignIn = { [weak self]  in
            self?.showMainMenu()
        }
    }
    
     func showMainMenu() {
        let rootViewController = MasterTabBarController.instantiate()
        navigationController.pushViewController(rootViewController, animated: true)
    }
    
    func PresentItemDetail(_ productItem: ProductItem) {
        let itemDetailViewController = ItemDetailsTableViewController.instantiate()
        itemDetailViewController.view.backgroundColor = .darkGray
        navigationController.pushViewController(itemDetailViewController, animated: true)
    }
}
