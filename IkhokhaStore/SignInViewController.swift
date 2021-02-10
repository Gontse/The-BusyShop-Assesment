//
//  ViewController.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/03.
//

import UIKit

@objc(SignInViewController)
final class SignInViewController: UIViewController, Storyboardable {

    // MARK: - Properties
    
    var didSignIn: (() -> Void)?
    
    @IBOutlet private weak var usernameTextField: UITextField! {
        didSet {
            #if DEBUG
            usernameTextField.text = "techcheck@ikhokha.com"
            #endif
        }
    }
    
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet {
            #if DEBUG
            passwordTextField.text = "Password"
            #endif
        }
    }
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - IBActions
    
    @IBAction func signInUser() {
        didSignIn?()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        title = screenTitle
    }
}

// MARK: - Strings

extension SignInViewController {
    var screenTitle: String { localizedString(forKey: "SignInScreenTitle") }
}
