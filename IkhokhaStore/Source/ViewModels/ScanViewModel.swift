//
//  ScanViewModel.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/09.
//

import Foundation


final class ScanViewModel {
    
    // MARK: - Properties
    
    private lazy var productsRepository: IProductsRepository = ProductsRepository()
    var failure: ((Error) -> Void )?
    var success: ((ProductItem) -> Void)?
    
    // MARK: - Methods
    
    func getScannedItem(_ itemBarcode: String) {
        productsRepository.fetchProduct(WithIdentifier: itemBarcode) {
        } onCompletion: { [weak self] (product) in
            self?.success?(product)
        } onError: { [weak self] (error) in
            self?.failure?(error)
            print("Failed with error: \(error)")
        }
    }
}
