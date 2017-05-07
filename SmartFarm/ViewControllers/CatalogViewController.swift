//
//  CatalogViewController.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 3/28/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var cartButton: UIBarButtonItem!
}

extension CatalogViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.CellIdentifiers.catalogItemCell, for: indexPath)
    }
    
}
