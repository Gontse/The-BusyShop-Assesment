//
//  ButtonTableViewCell.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/09.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var button: UIButton!
    
    var didPress: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        didPress?()
    }
}
