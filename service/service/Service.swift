//
//  Service.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 04/12/22.
//
import Foundation

protocol ServiceProtocol {
    func fetchProducts(completion: @escaping (ServiceResponse) -> Void)
}

enum ServiceResponse {
    case failure
    case successProducts(_ products: ResultResponse)
}


class Service: ServiceProtocol {
    private let session: URLSession = {
        let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
        return URLSession(configuration: urlSessionConfiguration)
    }()
    
    func fetchProducts(completion: @escaping (ServiceResponse) -> Void) {
        session.dataTask(with: Router.fetchProducts.request()) { (data, response, error) in
            guard let dataResult = data, error == nil else {
                completion(.failure)
                return
            }
            do {
                let products = try JSONDecoder().decode(ProductsResponse.self, from: dataResult)
                completion(.successProducts(products.resultado))
            } catch {
                completion(.failure)
            }
        }.resume()
    }
}
