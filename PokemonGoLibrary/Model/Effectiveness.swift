//
//  Effectiveness.swift
//  PGoLib
//
//  Created by 임채윤 on 8/17/24.
//

import Foundation

struct Effectiveness {
    typealias TypeEffectivenessData = (type: PokemonTypes, coefficient: Double)
    
    init(effectiveness: [PokemonTypes: Double]) {
        PokemonTypes.allCases.forEach { type in
            if let effectiveness = effectiveness[type]?.rounded(toPlaces: 2) {
                let typeEffectivenessData: TypeEffectivenessData = (type: type, coefficient: effectiveness)
                
                if effectiveness == 1.0 {
                    neutral.append(typeEffectivenessData)
                } else if effectiveness > 1 {
                    weakness.append(typeEffectivenessData)
                } else {
                    resistance.append(typeEffectivenessData)
                }
            }
        }
    }
    
    var weakness: [TypeEffectivenessData] = []
    var resistance: [TypeEffectivenessData] = []
    var neutral: [TypeEffectivenessData] = []
}
