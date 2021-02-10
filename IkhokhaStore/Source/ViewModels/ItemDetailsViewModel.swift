//
//  ItemDetailsViewModel.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/09.
//

import Foundation

class ItemDetailsViewModel {
   
    // MARK: - Properties
    
    private lazy var productsRepository: IProductsRepository = ProductsRepository()
    
    //MARK: - Methods
    
    func saveProduct(_ productItem: ProductItem) {
        productsRepository.addProduct(productItem)
    }
    
    func getUrlForImage(_ name: String, didReceiveUrl: @escaping ((URL) -> Void )) {
        productsRepository.fetchImageUrl(name) { (url) in
            didReceiveUrl(url)
        }
    }
}
