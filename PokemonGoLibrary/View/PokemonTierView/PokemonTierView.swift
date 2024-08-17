//
//  PokemonTierView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/19/24.
//

import SwiftUI

struct PokemonTierView: View {
    @EnvironmentObject private var dataModel: DataModel
    @State private var searchBarText: String = ""
    @State private var searchCount: Int = 0
    @State private var searchIDs = [UUID]()
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                GeometryReader { geometry in
                    ScrollView {
                        ForEach(dataModel.pokemonTiers, id: \.type) { tiers in
                            LazyVStack(alignment: .center, spacing: 0) {
                                // Header row
                                HStack {
                                    TypeIcon(type: tiers.type)
                                    
                                    Text(tiers.type.name)
                                        .font(.title2)
                                    
                                    Spacer()
                                }.padding(.init(top: 16, leading: 12, bottom: 8, trailing: 8))
                                
                                HStack(alignment: .center) {
                                    Text("랭크")
                                        .frame(width: geometry.size.width * 0.1)
                                    Text("포켓몬")
                                        .frame(width: geometry.size.width * 0.3)
                                    Text("기술")
                                        .frame(width: geometry.size.width * 0.3)
                                    Text("DPS")
                                        .frame(width: geometry.size.width * 0.15)
                                    Text("TDO")
                                        .frame(width: geometry.size.width * 0.15)
                                }
                                .id(tiers.type)
                                .background(tiers.type.backgroundColor.opacity(0.7))
                                
                                // Data rows
                                ForEach(tiers.tierList, id: \.id) { tier in
                                    HStack(alignment: .center) {
                                        Text(tier.rank.rawValue)
                                            .frame(width: geometry.size.width * 0.1)
                                        Text(tier.name)
                                            .frame(width: geometry.size.width * 0.3)
                                            .background(
                                                !searchIDs.isEmpty &&
                                                0..<searchIDs.count ~= searchCount &&
                                                tier.id == searchIDs[searchCount] ?
                                                Color.yellow : Color.clear
                                            )
                                        Text(tier.move)
                                            .frame(width: geometry.size.width * 0.3)
                                        Text(tier.dps)
                                            .frame(width: geometry.size.width * 0.15)
                                        Text(tier.tdo)
                                            .frame(width: geometry.size.width * 0.15)
                                    }
                                    .id(tier.id)
                                    .padding(8)
                                    .border(Color.gray, width: 0.5)
                                }
                            }
                        }
                    }
                    .frame(width: geometry.size.width)
                    .toolbar {
                        ToolbarItem(placement: .navigation) {
                            HStack {
                                Text(searchIDs.isEmpty ? "\(searchIDs.count)" : "\(searchCount + 1) / \(searchIDs.count)")
                                
                                SearchBar(text: $searchBarText)
                                    .frame(height: 24)
                                
                                Button {
                                    searchCount -= 1
                                } label: {
                                    Image(systemName: "chevron.up")
                                }
                                
                                Button {
                                    searchCount += 1
                                } label: {
                                    Image(systemName: "chevron.down")
                                }
                            }
                            .frame(width: geometry.size.width)
                                
                        }
                    }
                    .onChange(of: searchBarText) { _, text in
                        searchIDs = []
                        searchCount = 0
                        for tiers in dataModel.pokemonTiers {
                            for tier in tiers.tierList {
                                if tier.name.contains(text) {
                                    searchIDs.append(tier.id)
                                }
                            }
                        }
                        
                        if !searchIDs.isEmpty {
                            proxy.scrollTo(searchIDs[searchCount], anchor: .center)
                        }
                    }
                    .onChange(of: searchCount) { _, count in
                        guard !searchIDs.isEmpty else { return }
                        
                        if count < 0 { searchCount = searchIDs.count - 1 }
                        searchCount = searchCount % searchIDs.count
                        
                        proxy.scrollTo(searchIDs[searchCount], anchor: .center)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    PokemonTierView()
}
