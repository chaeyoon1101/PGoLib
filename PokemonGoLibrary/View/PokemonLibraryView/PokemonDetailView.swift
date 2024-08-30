//
//  PokemonDetailView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/21/24.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @State var segments = ["정보", "스킬", "CP 차트"]
    @State var selectedIndex = 0
    
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: .sectionHeaders) {
                PokemonPageView(pokemon: pokemon)
                    .padding(.bottom, 40)
                
                Section {
                    PokemonStatView(
                        pokemon: pokemon
                    )
                } header: {
                    SegmentedControlView(
                        segments: $segments,
                        selectedIndex: $selectedIndex
                    )
                    .frame(height: 56)
                    .background(Color.background)
                }
            }
        }
        .navigationTitle(pokemon.names.localized())
        .navigationBarTitleDisplayMode(.large)
        .background(Color.background)
    }
}
