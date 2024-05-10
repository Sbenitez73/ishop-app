//
//  ISProductsViewModel.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 7/05/24.
//

import Foundation

extension ISProductsView {
    class ISProductsViewModel: ObservableObject {
        
        private var _
        
        @Published var products: [Product] = []
        
        
        public func retrieveProducts() -> Void {
            productUseCases.getAll()
        }
    }
}

