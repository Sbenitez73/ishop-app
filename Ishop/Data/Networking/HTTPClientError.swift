//
//  HTTPClientError.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 9/05/24.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case parsingError
    case generic
}
