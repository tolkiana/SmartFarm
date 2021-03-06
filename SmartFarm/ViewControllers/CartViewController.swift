//
//  CartViewController.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/4/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    var viewModel = CartViewModel()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var checkoutButton: UIBarButtonItem!
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updateHanlder = { [weak self] in
            self?.tableView.reloadData()
        }
    }
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
            cell.configure(with: viewModel.itemViewModel(for: indexPath))
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.CellIdentifiers.totalCell) as! CartTotalCell
        cell.configure(with: TotalViewModel())
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeItem(at: indexPath)
            tableView.reloadData()
        }
    }
}
