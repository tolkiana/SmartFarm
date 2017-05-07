//
//  CartTotalCell.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/4/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import UIKit

class CartTotalCell: UITableViewCell {

    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var totalItemsLabel: UILabel!
    
    func configure(with viewModel: TotalViewModel) {
        self.totalItemsLabel.text = viewModel.totalItems
        self.totalAmountLabel.text = viewModel.total
    }
}
