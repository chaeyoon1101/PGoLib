//
//  PokemonFormsView.swift
//  PGoLib
//
//  Created by 임채윤 on 9/30/24.
//

import SwiftUI
import Kingfisher

struct PokemonFormsView: View {
    let pokemon: Pokemon
    
    var body: some View {
        if pokemon.hasMegaEvolution {
            PokemonMegaForm(pokemon: pokemon)
        }
        
    }
}

#Preview {
    PokemonFormsView(pokemon: DataManager.shared.getExamplePokemon(dex: 6))
}
