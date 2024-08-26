//
//  PokemonDetailView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/21/24.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon

    var body: some View {
        ScrollView {
            PokemonPageView(pokemon: pokemon)
            
            PokemonStatView(pokemon: pokemon)
        }
        .ignoresSafeArea(edges: .top)
        .navigationTitle(pokemon.names.localized())
        .navigationBarTitleDisplayMode(.large)
        .background(Color.gray.opacity(0.2))
    }
}
