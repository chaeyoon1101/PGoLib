//
//  PokemonImageVIew.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 5/27/24.
//

import SwiftUI
import Kingfisher

struct PokemonImageView: View {
    @State private var image: KFImage?
    
    let pokemonID: String
    let isShadow: Bool
    
    @EnvironmentObject private var dataModel: DataModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .center) {
                VStack {
                    if let image = image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48, height: 48)
                    } else {
                        ProgressView()
                    }
                }
            }
            
            if isShadow {
                Image("shadow")
                    .resizable()
                    .frame(width: 18, height: 18)
            }
        }
        .task {
            await loadImages()
        }
    }
    
    func loadImages() async {
        guard let pokemon = dataModel.findPokemon(id: pokemonID) else {
            return
        }
        
        if let form = pokemon.regionForms?[pokemonID.uppercased()] {
            let url = URL(string: form.assets?.image ?? "")
          
            image = KFImage(url)
        } else {
            let url = URL(string: pokemon.assets?.image ?? "")
            
            image = KFImage(url)
        }
    }
}

#Preview {
    PokemonImageView(pokemonID: "", isShadow: true)
}
