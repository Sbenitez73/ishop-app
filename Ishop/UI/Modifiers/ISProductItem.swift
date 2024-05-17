//
//  ISProductItem.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 16/05/24.
//

import SwiftUI

struct ISProductItem: View {
    
    var product: ProductPresentableItem
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image)) { result in
                result.image?
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 170, height: 170)
            
            VStack(alignment: .leading) {
                Text(product.category)
                    .font(.caption2)
                    .bold()
                    .textCase(.uppercase)
                    .foregroundColor(.gray)
                
                Text(product.title)
                    .font(.footnote)
                
                Text("$\(product.price)")
                    .bold()
            }
        }
        .background(.white)
    }
}
