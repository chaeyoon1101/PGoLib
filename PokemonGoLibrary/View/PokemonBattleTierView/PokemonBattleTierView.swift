//
//  PokemonBattleTierView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 5/6/24.
//

import SwiftUI
import Kingfisher

struct PokemonBattleTierView: View {
    @EnvironmentObject private var dataModel: DataModel
    
    @State private var selectedIndex: Int = 0
    @State private var segments = BattleLeagueTypes.segments
    
    var body: some View {
        VStack {
            SegmentedControlView(segments: $segments, selectedIndex: $selectedIndex)
            
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .center) {
                        ForEach(dataModel.battleLeagueTiers.data(index: selectedIndex), id: \.uid) { pokemon in
                            
                            BattleTierCell(pokemon: pokemon)
                                .id("\(selectedIndex)\(pokemon.rank)")
                            
                            Divider()
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .onChange(of: selectedIndex) { _, newValue in
                    let id = "\(newValue)\(1)"
                    
                    proxy.scrollTo(id, anchor: .top)
                }
            }
        }
        .navigationTitle("배틀 리그 티어")
    }
}

#Preview {
    PokemonBattleTierView()
}
