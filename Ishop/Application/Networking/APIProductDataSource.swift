//
//  APIProductDataSource.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 9/05/24.
//

import Foundation

protocol HTTPClientType {
    func makeRequest(endpoint: Endpoint) async -> Result<Data, HTTPClientError>
}

class APIProductDataSource: APIDataSourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getProductList() async -> Result<[ProductDTO], HTTPClientError> {
        let result = await httpClient.makeRequest(endpoint: Endpoint(method: .get))
        
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
    
    init(method: HTTPMethod, path: String? = nil, queryParams: [String: Any]? = nil ) {
        self.path = path ?? APIConstant.PRODUCT_BASE_URL
        self.queryParams = queryParams ?? [:]
        self.method = method
    }
}

enum HTTPMethod {
    case get
    case post
}
