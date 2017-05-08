//
//  CatalogViewController.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 3/28/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {
    let viewModel = CatalogViewModel()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cartButton: UIBarButtonItem!
}

extension CatalogViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfCategories;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.CellIdentifiers.catalogItemCell, for: indexPath) as! CatalogItemCell
        let itemViewModel = viewModel.itemViewModel(forIndexPath: indexPath)
        cell.configure(with: itemViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.categoryName(forSection: section)
    }
}
