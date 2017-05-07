//
//  CatalogItemCell.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/4/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import UIKit

class CatalogItemCell: UITableViewCell {
    
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    func configure(with viewModel: CatalogItemViewModel) {
        self.quantityLabel.text = viewModel.stock
        self.emojiLabel.text = viewModel.emoji
        self.nameLabel.text = viewModel.name
        self.priceLabel.text = viewModel.price
    }
}
