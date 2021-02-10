//
//  HomeViewController.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit

@objc(HomeViewController)
final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let firstViewController: SpecialsViewController = {
        let firstVC = SpecialsViewController.instantiate()
        firstVC.view.translatesAutoresizingMaskIntoConstraints = false
        return firstVC
    }()
    
    private let productsViewController: ProductsViewController = {
        let secondVC = ProductsViewController.instantiate()
        secondVC.view.translatesAutoresizingMaskIntoConstraints = false
        return secondVC
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        title = screenTitle
        setupChildViewControllers()
    }
    
    private func setupChildViewControllers() {
        addChild(firstViewController)
        addChild(productsViewController)
        
        view.addSubview(firstViewController.view)
        view.addSubview(productsViewController.view)
        
        productsViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        productsViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        productsViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        productsViewController.view.heightAnchor.constraint(equalToConstant: UIConstants.height240).isActive = true
        
        firstViewController.view.topAnchor.constraint(equalTo: productsViewController.view.bottomAnchor).isActive = true
        firstViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        firstViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        firstViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        productsViewController.didMove(toParent: self)
        firstViewController.didMove(toParent: self)
    }
}

// MARK: - Strings

extension HomeViewController {
    var screenTitle: String { localizedString(forKey: "HomeScreenTitle") }
}
