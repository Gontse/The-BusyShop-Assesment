//
//  RootViewController.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit

final class MasterTabBarController: UITabBarController, Storyboardable {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = screenTitle
    }
    
    private func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: logoutButtonText, style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc private func addTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension MasterTabBarController {
    // MARK: - Strings
    var screenTitle: String { localizedString(forKey: "HomeScreenTitle") }
    var logoutButtonText: String { localizedString(forKey: "LogoutText").uppercased() }
}
