//
//  StringTests.swift
//  IkhokhaStoreTests
//
//  Created by Gontse Ranoto on 2021/02/10.
//

import XCTest
@testable import IkhokhaStore

class StringTests: XCTestCase {

    func testAppStrings() {
        XCTAssertEqual(localizedString(forKey: "SignInScreenTitle"), "Sign In")
        XCTAssertEqual(localizedString(forKey: "HomeScreenTitle"), "Home")
        XCTAssertEqual(localizedString(forKey: "CartScreenTitle"), "Cart")
        XCTAssertEqual(localizedString(forKey: "ScannerScreenTitle"), "Scanner")
        XCTAssertEqual(localizedString(forKey: "LogoutText"), "logout")
    }
}
