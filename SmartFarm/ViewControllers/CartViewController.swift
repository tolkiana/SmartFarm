//
//  CartViewController.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/4/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    let viewModel = CartViewModel()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var checkoutButton: UIBarButtonItem!
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CartViewControllerConstants.Section.item == section {
            return viewModel.numberOfItems()
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if CartViewControllerConstants.Section.item == indexPath.section {
            let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.CellIdentifiers.cartItemCell) as! CartItemCell
            let itemViewModel = viewModel.itemViewModel(forIndexPath: indexPath)
            cell.configure(with: itemViewModel)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.CellIdentifiers.totalCell) as! CartTotalCell
        cell.configure(with: TotalViewModel())
        return cell
    }
}
