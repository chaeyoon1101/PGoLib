//
//  SearchBar.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/24/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("검색", text: $text)
            
            if text.isEmpty {
                EmptyView()
            } else {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.foreground)
                }
            }
            
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
