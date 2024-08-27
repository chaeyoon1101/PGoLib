//
//  PokemonLibraryItem.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/19/24.
//

import SwiftUI
import Kingfisher

struct PokemonLibraryItem: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("No. \(String(pokemon.dexNumber).padEnd(toLength: 4, withPad: "0"))")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                
                
                Text(pokemon.names.localized())
                    .font(.title)
                    .fontWeight(.bold)
                
                
                
                HStack {
                    if let primaryType = PokemonTypes(rawValue: pokemon.primaryType.type) {
                        Text(primaryType.name)
                            .frame(minWidth: 48)
                            .padding(8)
                            .background(primaryType.backgroundColor)
                            .cornerRadius(8)
                    }
                    
                    if let secondaryType = PokemonTypes(rawValue: pokemon.secondaryType?.type ?? "") {
                        Text(secondaryType.name)
                            .frame(minWidth: 48)
                            .padding(8)
                            .background(secondaryType.backgroundColor)
                            .cornerRadius(8)
                    }
                }
                .fontWeight(.semibold)
            }
            
            Spacer()
            VStack {
                pokemonImage
            }
        }
        .padding(18)
        .frame(width: 360, height: 120)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.1))
        }
    }
    
    var pokemonImage: some View {
        let url = pokemon.officialImage ?? pokemon.assets?.image ?? ""
        
        return KFImage(URL(string: url))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
