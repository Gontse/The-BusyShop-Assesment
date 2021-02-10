//
//  IkhokhaStoreTests.swift
//  IkhokhaStoreTests
//
//  Created by Gontse Ranoto on 2021/02/03.
//

import XCTest
@testable import IkhokhaStore

class StoryBoardableTests: XCTestCase {

   func testSignInInstantiation() {
    _ = SignInViewController.instantiate()
    }
    
    func testItemDetailsInstantiation() {
     _ = ItemDetailsTableViewController.instantiate()
     }
    
    func testSpecialsInstantiation() {
     _ = SpecialsViewController.instantiate()
     }
    
    func testProductsInInstantiation() {
     _ = ProductsViewController.instantiate()
     }
}
