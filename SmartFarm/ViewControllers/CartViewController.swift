//
//  CartViewController.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/4/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var checkoutButton: UIBarButtonItem!
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CartViewControllerConstants.Section.item == section {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if CartViewControllerConstants.Section.item == indexPath.section {
            return tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.CellIdentifiers.cartItemCell, for: indexPath)
        }
        return tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.CellIdentifiers.totalCell, for: indexPath)
    }
}
