//
//  SecondContainerViewController.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
     
    @IBOutlet private weak var productImage: UIImageView!
    
    func configureImageWithName(_ name: String) {
        productImage.image = UIImage(named: name)
    }
}

@objc(SpecialsViewController)
final class ProductsViewController: UIViewController, Storyboardable {
    
    // MARK: - Properties
    
    @IBOutlet private weak var productCollectionView: UICollectionView! {
        didSet{
            productCollectionView.dataSource = self
            productCollectionView.delegate = self
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/4, height: collectionView.frame.size.height/5)
    }
}

// MARK: - CollectionView Delegate & DataSource

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 10 }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath) as? ImageCollectionCell
        else { return UICollectionViewCell() }
        cell.configureImageWithName("icons\(indexPath.row + 1)")
        return cell
    }
}
