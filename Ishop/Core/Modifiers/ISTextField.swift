//
//  ISTextField.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 5/05/24.
//

import SwiftUI

struct ISTextField: View {
    
    @Binding var icon: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ISTextField(icon: .constant("eye"))
}
