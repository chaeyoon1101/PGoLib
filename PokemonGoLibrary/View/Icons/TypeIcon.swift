//
//  TypeIcon.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 6/4/24.
//

import SwiftUI

struct TypeIcon: View {
    let type: PokemonTypes
    
    var body: some View {
        ZStack {
            Circle()
                .fill(type.backgroundColor)
                .frame(width: 24, height: 24)

            type.image
                .resizable()
                .frame(width: 10, height: 10)
        }
    }
}

#Preview {
    TypeIcon(type: .fire)
}
