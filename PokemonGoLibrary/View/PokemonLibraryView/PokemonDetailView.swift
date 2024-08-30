//
//  PokemonDetailView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/21/24.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @State private var segments = PokemonDetailViewType.segments
    @State private var selectedIndex = PokemonDetailViewType.statView.rawValue
    
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: .sectionHeaders) {
                PokemonPageView(pokemon: pokemon)
                    .padding(.bottom, 40)
                
                Section {
                    let selectedView = PokemonDetailViewType(rawValue: selectedIndex)
                    
                    switch selectedView {
                    case .statView:
                        PokemonStatView(pokemon: pokemon)
                    case .moveView:
                        EmptyView()
                    case .dataView:
                        EmptyView()
                    case nil:
                        Text("무언가 문제가 발생했습니다.")
                            .onAppear {
                                selectedIndex = 0
                            }
                    }
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

enum PokemonDetailViewType: Int, CaseIterable {
    case statView = 0
    case moveView
    case dataView
    
    var name: String {
        switch self {
        case .statView:
            return "정보"
        case .moveView:
            return "스킬"
        case .dataView:
            return "데이터"
        }
    }
    
    static var segments: [String] {
        return allCases.map { $0.name }
    }
}
