//
//  PokemonDetailView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/21/24.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: PokemonElement
    
    var body: some View {
        VStack {
            Text("")
            Text(pokemon.names.localized())
        }
        .navigationTitle(pokemon.names.localized())
        
    }
}
