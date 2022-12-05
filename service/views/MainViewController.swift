//
//  MainViewController.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 04/12/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    lazy var viewModel: ProductsViewModel = {
        return ProductsViewModel()
    }()
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setViewModel()
    }
    
    private func setUI() {
        activityIndicator.isHidden = true
    }
    
    private func setViewModel() {
        viewModel.updatedDataClousure = { [weak self] products in
            DispatchQueue.main.async {
                guard let viewController  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
                viewController.setup(with: products)
                self?.navigationController?.pushViewController(viewController, animated: true)

            }
        }
        
        viewModel.loading = { [weak self] isLoading in
            DispatchQueue.main.async {
                self?.activityIndicator.isHidden = !isLoading
            }
        }
    }
    
    @IBAction func getData(_ sender: Any) {
        viewModel.fetchProducts()
    }
}

