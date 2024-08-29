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
                    .padding(.bottom, 48)
                
                Section {
                    PokemonStatView(
                        pokemon: pokemon
                    )
                    .frame(height: 800)
                } header: {
                    SegmentedControlView(
                        segments: $segments,
                        selectedIndex: $selectedIndex
                    )
                    .frame(height: 56)
                }
            }
  
        }
        .navigationTitle(pokemon.names.localized())
        .navigationBarTitleDisplayMode(.large)
        .background(Color.gray.opacity(0.2))
    }
}

extension UIApplication {
    // iOS 15 이상에서 윈도우를 가져오는 함수
    var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
