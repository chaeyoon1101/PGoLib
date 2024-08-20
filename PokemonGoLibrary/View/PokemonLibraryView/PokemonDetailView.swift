//
//  PokemonDetailView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/21/24.
//

import SwiftUI
import Kingfisher
struct PokemonDetailView: View {
    let pokemon: PokemonElement
    @State var isShiny: Bool = false
    
    var body: some View {
        ScrollView {
            // 그라데이션 배경
            ZStack(alignment: .bottom) {
                LinearGradient(
                    gradient:
                        Gradient(
                            colors: [
                                Color.clear,
                                PokemonTypes(rawValue: pokemon.primaryType.type)!.backgroundColor.opacity(0.4),
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
        .ignoresSafeArea(edges: .top)
        .navigationTitle(pokemon.names.localized())
        .navigationBarTitleDisplayMode(.large)
        .background(Color.gray.opacity(0.2))
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
