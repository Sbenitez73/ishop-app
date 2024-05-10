//
//  ProductRepository.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 7/05/24.
//

import Foundation

class ProductRepository: ProductListRepositoryType {
    
    private let apiDataSource: ApiDataSourceType
    
    init(apiDataSource: ApiDataSourceType) {
        self.apiDataSource = apiDataSource
    }
    
    func getProductList() async -> Result<[Product], ProductDomainError> {
        let result = await apiDataSource.getProductList()
        
        guard let productList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            
            return .failure(.generic)
        }
        
        return .success(productList.compactMap({ productDTO in
            return Product(id: productDTO.id, 
                           title: productDTO.title,
                           description: productDTO.description,
                           category: productDTO.category,
                           price: productDTO.price, 
                           image: productDTO.image,
                           rating: Rating(count: productDTO.rating.count, rate: productDTO.rating.rate))
        }))
    }
}
