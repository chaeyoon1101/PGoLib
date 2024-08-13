//
//  PokemonTier.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 7/13/24.
//

import Foundation

struct PokemonTier: Identifiable {
    var id = UUID()
    let type: PokemonTypes
    let tierList: [Tier]
}

struct Tier {
    let id = UUID()
    let rank: Rank
    let name: String
    let move: String
    let dps: String
    let tdo: String
}

enum Rank: String {
    case glassCannon = "유리 대포"
    case sPlus = "S+ 티어"
    case s = "S 티어"
    case aPlus = "A~A+ 티어"
    case b = "B+ 티어 이하"
}
