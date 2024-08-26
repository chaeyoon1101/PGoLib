//
//  PokemonPageView.swift
//  PGoLib
//
//  Created by 임채윤 on 8/21/24.
//

import SwiftUI
import Kingfisher

struct PokemonPageView: View {
    let pokemon: Pokemon
    @State var isShiny: Bool = false
    
    var body: some View {
        // 그라데이션 배경
        ZStack(alignment: .bottom) {
            LinearGradient(
                gradient:
                    Gradient(
                        colors: [
                            Color.clear,
                            (PokemonTypes(rawValue: pokemon.primaryType.type) ?? .normal).backgroundColor.opacity(0.4),
                        ]
                    ),
                startPoint: .top,
                endPoint: .bottom
            )
            
            // 포켓몬 이미지
            VStack {
                pokemonImage
                
                HStack {
                    if let primaryType = PokemonTypes(rawValue: pokemon.primaryType.type) {
                        Text(primaryType.name)
                            .frame(minWidth: 56)
                            .padding(8)
                            .background(primaryType.backgroundColor)
                            .cornerRadius(8)
                    }
                    
                    if let secondaryType = PokemonTypes(rawValue: pokemon.secondaryType?.type ?? "") {
                        Text(secondaryType.name)
                            .frame(minWidth: 56)
                            .padding(8)
                            .background(secondaryType.backgroundColor)
                            .cornerRadius(8)
                    }
                    
                    Button {
                        print(pokemon.class)
                        isShiny.toggle()
                    } label: {
                        Image("shiny")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 42, height: 42)
                            .foregroundStyle(isShiny ? Color.yellow : Color.white)
                    }
                }
                .fontWeight(.semibold)
            }
            .padding()
        }
        .frame(height: 400)
    }
    
    var pokemonImage: some View {
        let url = isShiny ? pokemon.assets?.shinyImage : pokemon.assets?.image
        
        return KFImage(URL(string: url ?? ""))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 220)
            .frame(maxWidth: 250)
            .clipped()
    }
}
