//
//  Products.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/08.
//

import Foundation
import Firebase
import CodableFirebase
import CoreData


final class ProductsRepository: IProductsRepository  {

    // MARK: - Properties
    
    let databaseReference = Database.database().reference()
    // Get a reference to the storage service using the default Firebase App
    let storage = Storage.storage()
    // Create a storage reference from our storage service
    private lazy var coreDataManager = CoreDataManager(modelName: AppCoreData.Model.products)
    
    var managedObjectContext: NSManagedObjectContext?
    
    // MARK: - FireBase
    
    func fetchProduct(WithIdentifier identifier: String,
                      always:@escaping () -> Void,
                      onCompletion: @escaping (ProductItem) -> Void,
                      onError: @escaping (Error) -> Void) {
        
        databaseReference.child(identifier).observeSingleEvent(of: .value) { (snapShot) in
            always()
            
            guard let value = snapShot.value else { return }
            do {
                let productItem = try FirebaseDecoder().decode(ProductItem.self, from: value)
                onCompletion(productItem)
            } catch let (error) {
                onError(error)
            }
        }
    }
    
    func fetchImageUrl(_ imageName: String, completion: @escaping((URL) -> Void)) {
        let storageRef = storage.reference(forURL: "\(AppUrl.imageBase)/\(imageName)" )
        storageRef.downloadURL { (url, error) in
            if let error = error {
                print(error)
            } else {
                if let url = url { completion(url)}
            }
        }
    }
}

// MARK: Core Data

extension ProductsRepository {
    
    func fetcProducts(onCompletion: @escaping ([ProductItem]) -> Void,
                      onError: @escaping (Error) -> Void) {
        
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: AppCoreData.Entity.product)
            
            do {
                let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
                
              let productList = result.map {
                ProductItem(description: $0.value(forKey: AppCoreData.Field.itemDescription) as? String,
                                                      image: "",
                                                      price: $0.value(forKey: AppCoreData.Field.price) as? Double)
                }
                
                
                
                onCompletion(productList)
            } catch {
                print("Failed")
            }
        
    }
    
    func addProduct(_ productItem: ProductItem) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let productEntity = NSEntityDescription.entity(forEntityName: AppCoreData.Entity.product, in: managedContext)!
        
        let product = NSManagedObject(entity: productEntity, insertInto: managedContext)
        product.setValue(productItem.description, forKey: AppCoreData.Field.itemDescription)
        product.setValue( productItem.price ?? 0.0, forKey: AppCoreData.Field.price)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
