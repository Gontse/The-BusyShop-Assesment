//
//  Storyboardable.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/03.
//

import UIKit

protocol Storyboardable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }

    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle { return .main }
    static var storyboardIdentifier: String { return String(describing: self) }
    
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else { fatalError("Unable to instatiate ViewController with Identifier \(storyboardIdentifier)") }
        
        return viewController
    }
}
