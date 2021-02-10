//
//  TitleDetailTableViewCell.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit

struct TitleDetailCellStyleDto {
    let itemTitleLabelFont: UIFont?
    let itemTitleLabelTextColor: UIColor?
    let itemDescriptionLabelFont: UIFont?
    let itemDescriptionLabelTextColor: UIColor?
}

class TitleDetailTableViewCell: UITableViewCell {
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    
    func configure(with itemTitleLabelText: String, itemDescriptionText: String, titleDetailCellStyle: TitleDetailCellStyleDto?) {
        itemTitleLabel.text = itemTitleLabelText
        itemDescriptionLabel.text = itemDescriptionText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
