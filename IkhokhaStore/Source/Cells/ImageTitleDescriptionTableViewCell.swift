//
//  ImageTitleDescriptionTableViewCell.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit

struct ImageTitleDescriptionTableViewCellStyleDto {
    let titleLabelFont: UIFont?
    let titleLabelTextColor: UIColor?
    let descriptionLabelFont: UIFont?
    let descriptionLabelTextColor: UIColor?
}

struct ImageTitleDescriptionTableViewCellConfigDto {
    let imageName: String
    let title: String
    let description: String
}

class ImageTitleDescriptionTableViewCell: UITableViewCell {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var ItemDescriptionLabel: UILabel!
    
    func config(_ config: ImageTitleDescriptionTableViewCellConfigDto, style: ImageTitleDescriptionTableViewCellStyleDto) {
        itemImageView.image = UIImage(named: config.imageName) ?? UIImage()
        itemTitleLabel.text = config.title
        ItemDescriptionLabel.text = config.description
        styleCell(style)
    }
    
    private func styleCell(_ style: ImageTitleDescriptionTableViewCellStyleDto) {
        itemTitleLabel.textColor = style.titleLabelTextColor
        itemTitleLabel.font = style.titleLabelFont
        ItemDescriptionLabel.textColor = style.descriptionLabelTextColor
        ItemDescriptionLabel.font = style.descriptionLabelFont
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
