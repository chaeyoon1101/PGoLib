//
//  PokemonStatItem.swift
//  PGoLib
//
//  Created by 임채윤 on 8/22/24.
//

import SwiftUI

struct PokemonStatItem<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        content()
            .frame(height: 96)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.1))
                    .stroke(Color.secondary, lineWidth: 1)
            )
    }
}
