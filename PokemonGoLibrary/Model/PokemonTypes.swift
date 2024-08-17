import SwiftUI

enum PokemonTypes: String, CaseIterable {
    case bug      = "POKEMON_TYPE_BUG"
    case dark     = "POKEMON_TYPE_DARK"
    case dragon   = "POKEMON_TYPE_DRAGON"
    case electric = "POKEMON_TYPE_ELECTRIC"
    case fire     = "POKEMON_TYPE_FIRE"
    case fairy    = "POKEMON_TYPE_FAIRY"
    case fighting = "POKEMON_TYPE_FIGHTING"
    case flying   = "POKEMON_TYPE_FLYING"
    case ghost    = "POKEMON_TYPE_GHOST"
    case grass    = "POKEMON_TYPE_GRASS"
    case ground   = "POKEMON_TYPE_GROUND"
    case ice      = "POKEMON_TYPE_ICE"
    case normal   = "POKEMON_TYPE_NORMAL"
    case poison   = "POKEMON_TYPE_POISON"
    case psychic  = "POKEMON_TYPE_PSYCHIC"
    case rock     = "POKEMON_TYPE_ROCK"
    case steel    = "POKEMON_TYPE_STEEL"
    case water    = "POKEMON_TYPE_WATER"
    
    var backgroundColor: Color {
        switch self {
        case .bug:      return Color(hex: 0x92BC2C)
        case .dark:     return Color(hex: 0x595761)
        case .dragon:   return Color(hex: 0x0C69C8)
        case .electric: return Color(hex: 0xF2D94E)
        case .fire:     return Color(hex: 0xFBA54C)
        case .fairy:    return Color(hex: 0xEE90E6)
        case .fighting: return Color(hex: 0xD3425F)
        case .flying:   return Color(hex: 0xA1BBEC)
        case .ghost:    return Color(hex: 0x5F6DBC)
        case .grass:    return Color(hex: 0x5FBD58)
        case .ground:   return Color(hex: 0xDA7C4D)
        case .ice:      return Color(hex: 0x75D0C1)
        case .normal:   return Color(hex: 0xA0A29F)
        case .poison:   return Color(hex: 0xB763CF)
        case .psychic:  return Color(hex: 0xFA8581)
        case .rock:     return Color(hex: 0xC9BB8A)
        case .steel:    return Color(hex: 0x5695A3)
        case .water:    return Color(hex: 0x539DDF)
        }
    }
    
    var image: Image {
        switch self {
        case .bug:      return Image("bug")
        case .dark:     return Image("dark")
        case .dragon:   return Image("dragon")
        case .electric: return Image("electric")
        case .fire:     return Image("fire")
        case .fairy:    return Image("fairy")
        case .fighting: return Image("fighting")
        case .flying:   return Image("flying")
        case .ghost:    return Image("ghost")
        case .grass:    return Image("grass")
        case .ground:   return Image("ground")
        case .ice:      return Image("ice")
        case .normal:   return Image("normal")
        case .poison:   return Image("poison")
        case .psychic:  return Image("psychic")
        case .rock:     return Image("rock")
        case .steel:    return Image("steel")
        case .water:    return Image("water")
        }
    }
    
    var name: String {
        switch self {
        case .bug:      return "벌레"
        case .dark:     return "악"
        case .dragon:   return "드래곤"
        case .electric: return "전기"
        case .fire:     return "불꽃"
        case .fairy:    return "페어리"
        case .fighting: return "격투"
        case .flying:   return "비행"
        case .ghost:    return "고스트"
        case .grass:    return "풀"
        case .ground:   return "땅"
        case .ice:      return "얼음"
        case .normal:   return "노말"
        case .poison:   return "독"
        case .psychic:  return "에스퍼"
        case .rock:     return "바위"
        case .steel:    return "강철"
        case .water:    return "물"
        }
    }
}
