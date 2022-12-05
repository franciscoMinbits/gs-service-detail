//
//  Router.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 04/12/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "get"
    case post = "post"
}

enum Router {
    case fetchProducts
    
    var path: String {
        switch self {
        case .fetchProducts:
            return "/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchProducts:
            return .get
        }
    }
    
    func request() -> URLRequest {
        let completeURL = "http://" + baseURL
        let baseUrl = URL(string: completeURL)!
        let _URL = URL(string: path, relativeTo: baseUrl)!
        var mutableURLRequest = URLRequest(url: _URL)
        mutableURLRequest.httpMethod = method.rawValue
        return mutableURLRequest
    }
    
     var baseURL: String {
         return Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
    }
}

