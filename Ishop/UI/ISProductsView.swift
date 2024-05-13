//
//  ISProductsView.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 7/05/24.
//

import SwiftUI

struct ISProductsView: View {
    
    @StateObject var viewModel = ProductListFactory.create()
    
    
    var body: some View {
        Text("Hello, Products!")
            .onAppear {
                viewModel.retrieveProducts()
            }
    }
    
}

#Preview {
    ISProductsView()
}
