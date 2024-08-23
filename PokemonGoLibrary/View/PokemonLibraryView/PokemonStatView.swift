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
            
            
            // 세 번째 줄: 두 개의 사각형
            HStack(spacing: 8) {
                PokemonStatItem {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("WEATHER BOOST")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("aa")
                        Spacer()
//                        HStack {
//                            ZStack {
//                                Circle()
//                                    .stroke(lineWidth: 1)
//                                    .frame(width: 40, height: 40)
//                                
//                                Image(systemName: "cloud")
//                                    .resizable()
//                                    .frame(width: 24, height: 24)
//                            }
//                        }
//                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                }
                PokemonStatItem {
                    Text("Blue")
                }
            }
        }
        .padding()
        .fontWeight(.bold)
//            BarGraphView(value: 30, barColor: .green)
    }
}
