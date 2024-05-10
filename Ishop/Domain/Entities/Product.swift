//
//  Product.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 7/05/24.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let image: String
    let rating: Rating
}
