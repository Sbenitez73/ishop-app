//
//  ProducUseCases.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 7/05/24.
//

import Foundation

protocol GetProductListType {
    func execute() async -> Result<[Product], ProductDomainError>
}

class GetProductList: GetProductListType {
    private let repository: ProductListRepositoryType
    
    init(repository: ProductListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Product], ProductDomainError> {
        let result = await repository.getProductList()
        
        guard let productList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        
        return .success(productList.sorted {$0.price < $1.price})
    }
}
