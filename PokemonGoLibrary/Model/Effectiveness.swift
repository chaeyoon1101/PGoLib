//
//  Effectiveness.swift
//  PGoLib
//
//  Created by 임채윤 on 8/17/24.
//

import Foundation

struct Effectiveness {
    typealias TypeEffectivenessData = (type: PokemonTypes, coefficient: String)
    
    init(effectiveness: [(PokemonTypes, Double)]) {
        var weakness = [TypeEffectivenessData]()
        var resistance = [TypeEffectivenessData]()
        var neutral = [TypeEffectivenessData]()
        
        effectiveness.forEach { (type, coefficient) in
            let typeEffectivenessData: TypeEffectivenessData = (type: type, coefficient: String(coefficient))
            
            if coefficient == 1.0 {
                neutral.append(typeEffectivenessData)
            } else if coefficient > 1 {
                weakness.append(typeEffectivenessData)
            } else {
                resistance.append(typeEffectivenessData)
            }
        }
        
        self.neutral    = neutral
        self.weakness   = weakness.sorted   { $0.coefficient > $1.coefficient }
        self.resistance = resistance.sorted { $0.coefficient < $1.coefficient }
    }
    
    var weakness: [TypeEffectivenessData] = []
    var resistance: [TypeEffectivenessData] = []
    var neutral: [TypeEffectivenessData] = []
}
