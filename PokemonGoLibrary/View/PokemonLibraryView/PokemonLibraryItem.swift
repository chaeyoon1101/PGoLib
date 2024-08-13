//
//  PokemonLibraryItem.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/19/24.
//

import SwiftUI
import Kingfisher

struct PokemonLibraryItem: View {
    let pokemon: PokemonElement
    
    let size: CGFloat
    
    var body: some View {
        VStack {
            pokemonImage
                
            Text(pokemon.names.localized())
                .font(.subheadline)
        }
    }
    
    var pokemonImage: some View {
        if let url = pokemon.assets?.image {
            KFImage(URL(string: url))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size * 0.7, height: size * 0.7)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.purple.opacity(0.2))
                        .frame(width: size * 0.9, height: size * 0.9)
                }
        } else {
            KFImage(URL(string: ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size * 0.7, height: size * 0.7)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.purple.opacity(0.2))
                        .frame(width: size * 0.9, height: size * 0.9)
                }
        }
    }
}
