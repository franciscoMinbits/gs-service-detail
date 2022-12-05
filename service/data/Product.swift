//
//  Product.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 04/12/22.
//

import Foundation


struct ProductsResponse: Decodable {
    let resultado: ResultResponse

}

struct ResultResponse: Decodable {
    let productos: [Product]
    let categoria: String?
}

struct Product: Decodable {
    let id: String?
    let name: String?
    let imagesUrls: [String]
    let sku: String?
    let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nombre"
        case imagesUrls = "urlImagenes"
        case sku
        case price = "precioFinal"
    }
    
     init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        imagesUrls = try values.decodeIfPresent([String].self, forKey: .imagesUrls) ?? []
        sku = try values.decodeIfPresent(String.self, forKey: .sku)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
    }
}
