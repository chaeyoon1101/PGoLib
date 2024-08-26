//
//  PokemonStatView.swift
//  PGoLib
//
//  Created by 임채윤 on 8/22/24.
//

import SwiftUI

struct PokemonStatView: View {
    let pokemon: Pokemon
    
    private let maxCPValue = 5629.0
    private let maxATKValue = 414.0
    private let maxDEFValue = 505.0
    private let maxSTAValue = 452.0
    
    var body: some View {
        VStack(spacing: 16) {
            // CP STAT
            HStack {
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("MAX CP")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("\(pokemon.cpData.last ?? "") CP")
                            .font(.title)
                            .foregroundStyle(.green)
                        BarGraphView(
                            value: calculateRatio(
                                valueToCalculate: Double(pokemon.cpData.last ?? "0"),
                                maxValue: maxCPValue
                            ),
                            barColor: .green
                        )
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
                        
                        Text("\(pokemon.stats?.attack ?? 0) ATK")
                            .font(.title3)
                            .foregroundStyle(.blue)
                        BarGraphView(
                            value: calculateRatio(
                                valueToCalculate: Double(pokemon.stats?.attack ?? 0),
                                maxValue: maxATKValue
                            ),
                            barColor: .blue
                        )
                    }
                    .padding()
                }
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("DEFENSE")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("\(pokemon.stats?.defense ?? 0) DEF")
                            .font(.title3)
                            .foregroundStyle(.yellow)
                        BarGraphView(
                            value: calculateRatio(
                                valueToCalculate: Double(pokemon.stats?.defense ?? 0),
                                maxValue: maxDEFValue
                            ),
                            barColor: .yellow
                        )
                    }
                    .padding()
                }
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("STAMINA")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("\(pokemon.stats?.stamina ?? 0) STA")
                            .font(.title3)
                            .foregroundStyle(.red)
                        BarGraphView(
                            value: calculateRatio(
                                valueToCalculate: Double(pokemon.stats?.stamina ?? 0),
                                maxValue: maxSTAValue
                            ),
                            barColor: .red
                        )
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
    
    func calculateRatio(valueToCalculate: Double?, maxValue: Double) -> CGFloat {
        guard let value = valueToCalculate else { return 0.0 }
        
        return value / maxValue * 100
    }
}
