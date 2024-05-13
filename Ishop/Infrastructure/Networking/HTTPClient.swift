//
//  HTTPClient.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 12/05/24.
//

import Foundation
import Alamofire


class ErrorResolver {
    func resolve(statusCode: Int) -> HTTPClientError {
        guard statusCode < 500 else {
            return .clientError
        }
        
        return .serverError
    }
}

class HTTPClient: HTTPClientType {
    
    private var data: Data = Data()
    
    let errorResolver: ErrorResolver
    
    init(errorResolver: ErrorResolver) {
        self.errorResolver = errorResolver
    }
    
    func makeRequest(endpoint: Endpoint) async -> Result<Data, HTTPClientError> {
        return await withCheckedContinuation { continuation in
            AF.request(endpoint.path, interceptor: .retryPolicy)
            .validate()
            .responseData {response in
                switch response.result {
                case .failure(let error):
                    continuation.resume(returning: .failure(.serverError))
                case .success(let data):
                    continuation.resume(returning: .success(data))
                }
            }
            
        }
    }
}
