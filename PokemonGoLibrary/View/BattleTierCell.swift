//
//  BattleTierCell.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 6/4/24.
//

import SwiftUI

struct BattleTierCell: View {
    @EnvironmentObject var dataModel: DataModel
    
    let pokemon: BattleLeagueElement
    
    var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .center) {
                Text(String(pokemon.rank))
                    .frame(width: proxy.size.width * 0.1)
                
                HStack {
                    PokemonImageView(pokemonID: pokemon.id, isShadow: pokemon.isShadow)
                    Text(pokemon.name)
                    Spacer()
                }
                .frame(width: proxy.size.width * 0.65)
                
                HStack {
                    ForEach(pokemonTypes(pokemonID: pokemon.id), id: \.rawValue) { type in
                        TypeIcon(type: type)
                    }
                }
                .frame(width: proxy.size.width * 0.2)
            }
        }
        .frame(minHeight: 60)
    }
    
    private func pokemonTypes(pokemonID: String) -> [PokemonTypes] {
        guard let pokemon = dataModel.findPokemon(id: pokemonID) else {
            return []
        }
        
        return pokemon.types
    }
}
