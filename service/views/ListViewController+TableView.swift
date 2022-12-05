//
//  ListViewController+TableView.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 04/12/22.
//

import Foundation
import UIKit

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productTableViewCell", for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.setup(with: product)
        return cell
    }
}
