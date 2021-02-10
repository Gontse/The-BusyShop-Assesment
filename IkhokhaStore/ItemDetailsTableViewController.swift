//
//  ItemDetailsViewController.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit
import Kingfisher

// MARK: Row Identifiers

enum ItemDetailsRowIdentifier: String, CaseIterable {
    case ItemImage = "ItemImage"
    case ItemTitleDetails = "ItemTitleDetails"
    case ItemCheckOutButton = "ItemCheckOutButton"
}

@objc(ItemDetailsTableViewController)
final class ItemDetailsTableViewController: UITableViewController, Storyboardable {
    
    var productItem: ProductItem?
    private let viewModel = ItemDetailsViewModel()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Private Methods
    
    private func setup() {
        registerNib()
        tableView.removeExtraCellLines()
        title = "Selected Item"
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: String(describing: ImageTableViewCell.self),
                                 bundle: nil), forCellReuseIdentifier: CellIdentifiers.imageTableViewCell)
        
        tableView.register(UINib(nibName: String(describing: TitleDetailTableViewCell.self),
                                 bundle: nil), forCellReuseIdentifier: CellIdentifiers.titleDetailTableViewCell)
        
        tableView.register(UINib(nibName: String(describing: ButtonTableViewCell.self),
                                 bundle: nil), forCellReuseIdentifier: CellIdentifiers.ButtonTableViewCell)
    }
    
    
    // MARK: TableView Delegate & Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemDetailsRowIdentifier.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowIdentifier = ItemDetailsRowIdentifier.allCases[indexPath.row]
        switch rowIdentifier {
        case .ItemImage:
            return makeImageCell()
        case .ItemTitleDetails:
            return makeTitleDetailsCell()
        case .ItemCheckOutButton:
           return makeCheckOutButtonCell()
        }
    }
}

// MARK: - Cell Factory

extension ItemDetailsTableViewController {
    
    private func makeImageCell() -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.imageTableViewCell) as? ImageTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: "ImagePleaceHolder")
        
        if let imageName = productItem?.image {
            viewModel.getUrlForImage(imageName) { (url) in
                debugPrint("url: \(url)")
                cell.imageView?.kf.setImage(with: url)
            }
        }
        return cell
    }
    
    private func makeTitleDetailsCell() -> UITableViewCell {
        guard  let name = productItem?.description,
               let price = productItem?.price,
               let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.titleDetailTableViewCell) as? TitleDetailTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(with: name, itemDescriptionText: "\(price.asLocaleCurrency)", titleDetailCellStyle: nil)
        return cell
    }
    
    private func makeCheckOutButtonCell() -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.ButtonTableViewCell) as? ButtonTableViewCell
        else { return UITableViewCell() }
        
        cell.didPress = { [weak self]  in
            if let productItem = self?.productItem { self?.viewModel.saveProduct(productItem) }
            self?.dismiss(animated: true)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowIdentifier = ItemDetailsRowIdentifier.allCases[indexPath.row]
        switch rowIdentifier {
        case .ItemImage:
            return 300
        case .ItemTitleDetails:
            return 80
        case .ItemCheckOutButton:
            return 70
        }
    }
}

