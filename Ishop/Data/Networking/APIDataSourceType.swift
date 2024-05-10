//
//  ApiDataSourceType.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 9/05/24.
//

import Foundation

protocol APIDataSourceType {
    func getProductList() async -> Result<[ProductDTO], HTTPClientError>
}
