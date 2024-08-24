//
//  EffectivenessView.swift
//  PGoLib
//
//  Created by 임채윤 on 8/18/24.
//

import SwiftUI
import Flow

struct EffectivenessView: View {
    let title: String
    let effectiveness: [(type: PokemonTypes, coefficient: String)]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            HFlow {
                ForEach(effectiveness, id: \.type) { data in
                    HStack {
                        Text(data.type.name)
                        Text(data.coefficient + "x")
                    }
                    .frame(minWidth: 48)
                    .padding(8)
                    .background(data.type.backgroundColor)
                    .cornerRadius(8)
                    .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Color.white)
        }
    }
}


