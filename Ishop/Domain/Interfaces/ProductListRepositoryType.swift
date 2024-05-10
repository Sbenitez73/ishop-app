//
//  ProductListRepositoryType.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 9/05/24.
//

import Foundation

protocol ProductListRepositoryType {
    func getProductList() async -> Result<[Product], ProductDomainError>
}
