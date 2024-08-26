//
//  PokemonLibraryView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/19/24.
//

import SwiftUI

struct PokemonLibraryView: View {
    @EnvironmentObject var dataModel: DataModel
    @State private var searchBarText: String = ""
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                SearchBar(text: $searchBarText)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 10) {
                        ForEach(dataModel.pokedex, id: \.id) { pokemon in
                            if (searchBarText == "" || isSearchedPokemon(pokemon)) {
                                NavigationLink {
                                    PokemonDetailView(pokemon: pokemon)
                                } label: {
                                    PokemonLibraryItem(pokemon: pokemon)
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("포켓몬 도감")
        .padding()
        .ignoresSafeArea(edges: .bottom)
    }
    
    private func isSearchedPokemon(_ pokemon: Pokemon) -> Bool {
        let checkNameEquality = pokemon.names.languages.values.map { name in
            let lowercasedName = name.lowercased()
            let lowercasedText = searchBarText.lowercased()
            
            return lowercasedName.contains(lowercasedText)
        }.contains(true)

        let checkPrimaryTypeEquality = pokemon.primaryType.names.languages.values.map { type in
            let lowercasedType = type.lowercased()
            let lowercasedText = searchBarText.lowercased()
            
            return lowercasedType.contains(lowercasedText)
        }.contains(true)
        
        let checkSecondaryTypeEquality = pokemon.secondaryType?.names.languages.values.map { type in
            let lowercasedType = type.lowercased()
            let lowercasedText = searchBarText.lowercased()
            
            return lowercasedType.contains(lowercasedText)
        }.contains(true)
        
        let checkDexNumberEquality = pokemon.dexNumber == Int(searchBarText)
        
        return checkNameEquality ||
               checkDexNumberEquality ||
               checkPrimaryTypeEquality ||
               (checkSecondaryTypeEquality ?? false)
    }
}

#Preview {
    PokemonLibraryView()
        .environmentObject(DataModel())
}
