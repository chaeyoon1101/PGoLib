//
//  PokemonClass.swift
//  PGoLib
//
//  Created by 임채윤 on 8/21/24.
//

import SwiftUI

enum PokemonClass: String {
    case common = "POKEMON_CLASS_COMMON"
    case ultraBeast = "POKEMON_CLASS_ULTRA_BEAST"
    case mythic = "POKEMON_CLASS_MYTHIC"
    case legendary = "POKEMON_CLASS_LEGENDARY"
    
    var name: String {
        switch self {
        case .common:
            return "COMMON"
        case .ultraBeast:
            return "ULTRA BEAST"
        case .mythic:
            return "MYTHIC"
        case .legendary:
            return "LEGENDARY"
        }
    }
    
    var gradientColor: [Color] {
        switch self {
        case .common:
            return [.gray, .secondary]
        case .ultraBeast:
            return [.yellow, .blue]
        case .mythic:
            return [.yellow, .mint]
        case .legendary:
            return [.red, .orange]
        }
    }
}
