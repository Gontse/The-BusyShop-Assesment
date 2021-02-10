//
//  IProductsRepository.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/08.
//

import Foundation

protocol IProductsRepository {
    func fetchProduct(WithIdentifier identifier: String,
                      always:@escaping () -> Void,
                      onCompletion: @escaping (ProductItem) -> Void,
                      onError: @escaping (Error) -> Void)
    
    func fetcProducts(onCompletion: @escaping ([ProductItem]) -> Void,
                      onError: @escaping (Error) -> Void)
    
    func addProduct(_ productItem: ProductItem)
    func fetchImageUrl(_ imageName: String, completion: @escaping((URL) -> Void))
}
