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
                    .fill(Color.itemBackground)
                    .stroke(Color.secondary, lineWidth: 1)
            )
    }
}
