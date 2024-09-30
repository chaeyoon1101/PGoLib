//
//  PokemonStatView.swift
//  PGoLib
//
//  Created by 임채윤 on 8/22/24.
//

import SwiftUI

struct PokemonStatView: View {
    let pokemon: Pokemon
    
    var body: some View {
        PokemonStatGrid(pokemon: pokemon)
    }
}


#Preview {
    PokemonStatView(pokemon: DataManager.shared.getExamplePokemon(dex: 1))
}
