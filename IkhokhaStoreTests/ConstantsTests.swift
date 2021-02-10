//
//  ConstantsTests.swift
//  IkhokhaStoreTests
//
//  Created by Gontse Ranoto on 2021/02/10.
//

import XCTest
@testable import IkhokhaStore

class ConstantsTests: XCTestCase {
    
    func testAppUrlConstants() { XCTAssertEqual(AppUrl.imageBase, "gs://the-busy-shop.appspot.com") }
    
    func testAppCellIdentifierConstants() {
        XCTAssertEqual(CellIdentifiers.imageTableViewCell, "ImageCell")
        XCTAssertEqual(CellIdentifiers.titleDetailTableViewCell, "TitleDetailCell")
        XCTAssertEqual(CellIdentifiers.ImageTitleDescriptionTableViewCell, "ImageTitleDescriptionCell")
        XCTAssertEqual(CellIdentifiers.ButtonTableViewCell, "ButtonCell")
    }
    
    func testCoreDataConstants() {
        XCTAssertEqual(AppCoreData.Model.products, "Products")
        XCTAssertEqual(AppCoreData.Entity.product, "Product")
        XCTAssertEqual(AppCoreData.Field.itemDescription, "itemdescription")
        XCTAssertEqual(AppCoreData.Field.price, "price")
        
    }
}
