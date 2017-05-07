//
//  CartItemCell.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/4/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {
    private var viewModel: CartItemViewModel?
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    
    
    func configure(with viewModel: CartItemViewModel) {
        self.viewModel = viewModel
        self.emojiLabel.text = viewModel.emoji
        self.nameLabel.text = viewModel.name
        self.quantityLabel.text = viewModel.quantity
        self.priceLabel.text = viewModel.price
        self.stepper.value = viewModel.stepperValue
    }
    
    @IBAction func changeQuantity(_ sender: UIStepper) {
        self.viewModel?.updateQuantity(value: sender.value)
    }
}
