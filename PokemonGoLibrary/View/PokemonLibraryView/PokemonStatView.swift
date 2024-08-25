//
//  PokemonStatView.swift
//  PGoLib
//
//  Created by 임채윤 on 8/22/24.
//

import SwiftUI

struct PokemonStatView: View {
    let pokemon: PokemonElement
    
    var body: some View {
        VStack(spacing: 16) {
            // CP STAT
            HStack {
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("MAX CP")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("4329 CP")
                            .font(.title)
                            .foregroundStyle(.green)
                        BarGraphView(value: 60, barColor: .green)
                    }
                    .padding()
                }
            }
            
            // ATTACK, DEFENSE, STAMINA STAT
            HStack(spacing: 8) {
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("ATTACK")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("254 ATK")
                            .font(.title3)
                            .foregroundStyle(.blue)
                        BarGraphView(value: 60, barColor: .blue)
                    }
                    .padding()
                }
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("DEFENSE")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("236 DEF")
                            .font(.title3)
                            .foregroundStyle(.yellow)
                        BarGraphView(value: 55, barColor: .yellow)
                    }
                    .padding()
                }
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("STAMINA")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("192 STA")
                            .font(.title3)
                            .foregroundStyle(.red)
                        BarGraphView(value: 45, barColor: .red)
                    }
                    .padding()
                }
            }
        
            // Weather boost, pokemon class STAT
            HStack(spacing: 8) {
                PokemonStatItem {
                    VStack(alignment: .leading) {
                        
                        Text("WEATHER BOOST")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        HStack {
                            ForEach(pokemon.types, id: \.rawValue) { type in
                                let weatherBoost = type.weatherBoost
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(
                                        LinearGradient(
                                            colors: weatherBoost.gradientColor,
                                            startPoint: .topLeading,
                                            endPoint: .topTrailing
                                        )
                                    )
                                    .overlay(
                                        HStack {
                                            Image(weatherBoost.image)
                                                .resizable()
                                                .renderingMode(.template)
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundStyle(Color.white)
                                                .frame(width: 32, height: 32)
                                        }
                                    )
                            }
                        }   
                    }
                    .padding()
                }
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("CLASS")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        
                        LinearGradient(
                            colors: pokemon.class.gradientColor,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .mask {
                            Text(pokemon.class.name)
                                .font(.title3)
                        }
                        
                    }
                    .padding()
                }
            }
        }
        .padding()
        .fontWeight(.bold)
    }
}
