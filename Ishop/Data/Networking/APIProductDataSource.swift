//
//  APIProductDataSource.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 9/05/24.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: String) -> Result<Data, HTTPClientError>
}

class APIProductDataSource: APIDataSourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    
    func getProductList() async -> Result<[ProductDTO], HTTPClientError> {
        let result = httpClient.makeRequest(endpoint: "https://fakestoreapi.com/products")
        
        guard case .success(let data) = result else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }

            return .failure(error)
        }

        guard let productList = try? JSONDecoder().decode([ProductDTO].self, from: data) else {
            return .failure(.parsingError)
        }
        
        return .success(productList)
    }
}

struct Endpoint {
    let path: String
    let queryParams: [String: Any]
    let method: HTTPMethod
}

enum HTTPMethod {
    case get
    case post
}
