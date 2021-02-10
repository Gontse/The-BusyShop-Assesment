//
//  CartViewModel.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/09.
//

import Foundation

final class CartViewModel {
    
    // MARK: - Properties
    
    private lazy var productsRepository: IProductsRepository = ProductsRepository()
    var failure: ((Error) -> Void )?
    var success: (() -> Void)?
    
    //private(set) just for tests perposes
    private(set) var products = [ProductItem]() {
        didSet { createProductDict() }
    }
    private(set) var productDictionary = [String: [ProductItem]]()
    
    // MARK: - Methods
    
    func loadAddedItems() {
        productsRepository.fetcProducts { [weak self] productList in
            self?.products = productList
            self?.success?()
        } onError: { [weak self] (error) in
            self?.failure?(error)
        }
    }
    
    func createProductDict() {
        var animalsDict = [String: [ProductItem]]()
        for item in products {
            // Get the first letter of the animal name and build the dictionary
            guard let safeItem = item.description else { return  }
            let productKey = safeItem.description
            if var animalValues = animalsDict[productKey] {
                animalValues.append(item)
                animalsDict[productKey] = animalValues
            } else {
                animalsDict[productKey] = [item]
            }
        }
        productDictionary = animalsDict
    }

    func getProductForRow(_ row: Int) -> ProductItem { products[row] }
    func getNumberOfProducts() -> Int { products.count }
}
