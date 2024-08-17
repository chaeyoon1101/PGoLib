//
//  PokemonCounterTypeView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 4/19/24.
//

import SwiftUI

struct PokemonCounterTypeView: View {
    let types = PokemonTypes.allCases
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    
    @State var selectedIndexes = [Int]()
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0..<20) { index in
                if index < types.count {
                    Button {
                        select(index)
                    } label: {
                        Text(types[index].name)
                            .frame(minWidth: 48)
                            .padding()
                            .fontWeight(.semibold)
                            .foregroundColor(
                                isSelected(index) ?
                                .white : .primary
                            )
                            .background(
                                isSelected(index) ?
                                types[index].backgroundColor : types[index].backgroundColor.opacity(0.1)
                            )
                            .cornerRadius(8)
                            .animation(.easeInOut(duration: 0.2), value: selectedIndexes)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(types[index].backgroundColor, lineWidth: 2)
                    )

                    
                }
            }
        }
        .padding()
        
        Spacer()
    }
    
    private func select(_ index: Int) {
        if selectedIndexes.count == 2 {
            selectedIndexes.removeFirst()
        }
        selectedIndexes.append(index)
    }
    
    private func isSelected(_ index: Int) -> Bool {
        return selectedIndexes.contains(index)
    }
}

#Preview {
    PokemonCounterTypeView()
}
