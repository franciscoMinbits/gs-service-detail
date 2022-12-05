//
//  ProductsViewModel.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 04/12/22.
//


import Foundation
import UIKit

final class ProductsViewModel {
    private let apiService: Service = Service()
    private(set) var products: [Product] = []
    var updatedDataClousure: (([Product])->())?
    var loading: ((Bool) -> Void)?
    
    init(with products : [Product] = []) {
        self.products = products
    }

    func fetchProducts() {
        loading?(true)
        apiService.fetchProducts { [weak self] response in
            self?.loading?(false)
            switch response {
            case .failure:
                break
            case .successProducts(let products):
                self?.updatedDataClousure?(products)
                break
            }
        }
    }
}
