//
//  ProductTableViewCell.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 04/12/22.
//

import Foundation
import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var skuLabel: UILabel!
    
    func setup(with product: Product) {
        self.titleLabel.text = product.name
        self.skuLabel.text = product.sku
    }
}

