//
//  CartTableViewController.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit
import CoreData

@objc(CartTableViewController)
final class CartTableViewController: UITableViewController, Storyboardable {
    
    // MARK: - Private methods
    
    private let viewModel = CartViewModel()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModelBindings()
        viewModel.loadAddedItems()
        
    }
    
    // MARK: - Private Methods
    
    private func viewModelBindings() {
        viewModel.success = { [weak self] in self?.tableView.reloadData() }
    }
    
    private func setup() {
        tableView.register(UINib(nibName: String(describing: ImageTitleDescriptionTableViewCell.self), bundle: nil), forCellReuseIdentifier: CellIdentifiers.ImageTitleDescriptionTableViewCell)
    }
    
    // MARK: - TableView DataSource & Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfProducts()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.ImageTitleDescriptionTableViewCell) as? ImageTitleDescriptionTableViewCell
        else { return UITableViewCell() }
        
        let item = viewModel.getProductForRow(indexPath.row)
        if let description = item.description, let price = item.price {
            cell.config(ImageTitleDescriptionTableViewCellConfigDto(imageName: "ImagePleaceHolder.png",
                                                                    title: description,
                                                                    description: "\(price.asLocaleCurrency)"),
                        style: ImageTitleDescriptionTableViewCellStyleDto(titleLabelFont: .none,
                                                                          titleLabelTextColor: .black,
                                                                          descriptionLabelFont: .none,
                                                                          descriptionLabelTextColor: .darkGray))
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
