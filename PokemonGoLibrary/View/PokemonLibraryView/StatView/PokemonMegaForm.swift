//
//  PokemonMegaForm.swift
//  PGoLib
//
//  Created by 임채윤 on 10/1/24.
//

import SwiftUI
import Kingfisher

struct PokemonMegaForm: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack(spacing: 16) {
            Text("메가진화")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                if let evolutions = pokemon.megaEvolutions {
                    ForEach(evolutions.sorted(by: { $0.key < $1.key } ), id: \.key) { key, evolution in
                        VStack {
                            KFImage(URL(string: evolution.officialImage ?? evolution.assets.image))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 140)
                            
                            Spacer()
                            
                            Text(evolution.names.localized())
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.itemBackground)
                                .stroke(Color.secondary)
                        )
                    }
                }
            }
            .frame(height: 180)
        }
        .font(.headline)
        .padding()
    }
}
