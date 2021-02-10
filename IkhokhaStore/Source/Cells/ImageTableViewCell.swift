//
//  ItemDetailsTableViewCell.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    
    func configure(with ImageName: String) {
        itemImageView.image = UIImage(named: ImageName) ?? UIImage()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
