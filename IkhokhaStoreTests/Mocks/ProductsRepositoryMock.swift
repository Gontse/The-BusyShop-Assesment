//
//  RepositoryMock.swift
//  IkhokhaStoreTests
//
//  Created by Gontse Ranoto on 2021/02/10.
//

import Foundation

class ProductsRepositoryMock {
    
    func fetchProduct(WithIdentifier identifier: String,
                      always:@escaping () -> Void,
                      onCompletion: @escaping (ProductItem) -> Void,
                      onError: @escaping (Error) -> Void) {
        
       let data = loadStub(name: "data", extension: "json")
        let decoder = JSONDecoder()
        
        // Configure JSON Decoder
        decoder.dateDecodingStrategy = .secondsSince1970
        // Decode JSON
        guard let products = try? decoder.decode([ProductItem].self, from: data) else { return }
        
        //Takes took me time get the struct right so i'll just take first, and not use Identifier
        onCompletion(products.first!)
    }
        
    func loadStub(name: String, extension: String) -> Data {
        // Obtain Reference to Bundle
        let bundle = Bundle(for: type(of: self))

        // Ask Bundle for URL of Stub
        let url = bundle.url(forResource: name, withExtension: `extension`)

        // Use URL to Create Data Object
        return try! Data(contentsOf: url!)
       }
    
    }

