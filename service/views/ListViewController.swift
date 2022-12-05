//
//  ListViewController.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 04/12/22.
//

import UIKit

protocol ListViewControllerDelegate: AnyObject {
    func onProductSelected(_ product: Product)
}

class ListViewController: UIViewController {
    lazy var viewModel: ProductsViewModel = {
        return ProductsViewModel()
    }()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    weak var delegate: ListViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setViewModel()
    }
    
    func setup(with products : [Product], delegate: ListViewControllerDelegate? = nil) {
        self.viewModel = ProductsViewModel(with: products)
        self.delegate = delegate
    }
    
    private func setUI() {
        activityIndicator.isHidden = true
    }
    
    func setViewModel() {
        viewModel.updatedDataClousure = { [weak self] products in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        viewModel.loading = { [weak self] isLoading in
            DispatchQueue.main.async {
                self?.activityIndicator.isHidden = !isLoading
            }
        }
    }
}

