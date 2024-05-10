//
//  ProductDTO.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 9/05/24.
//

import Foundation

struct ProductDTO: Codable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let image: String
    let rating: RatingDTO
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, category, image
        case price
        case rating
    }
}
