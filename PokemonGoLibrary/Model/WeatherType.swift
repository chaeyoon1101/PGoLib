//
//  WeatherType.swift
//  PGoLib
//
//  Created by 임채윤 on 8/23/24.
//

import SwiftUI

enum WeatherType {
    case sunny
    case partlyCloudy
    case cloudy
    case rainy
    case windy
    case snow
    case fog
    
    var image: String {
        switch self {
        case .sunny:
            return "weather_sunny"
        case .partlyCloudy:
            return "weather_partlyCloudy"
        case .cloudy:
            return "weather_cloudy"
        case .rainy:
            return "weather_rainy"
        case .windy:
            return "weather_windy"
        case .snow:
            return "weather_snow"
        case .fog:
            return "weather_fog"
        }
    }
    
    var gradientColor: [Color] {
        switch self {
        case .sunny:
            return [
                PokemonTypes.ground.backgroundColor,
                PokemonTypes.fire.backgroundColor,
                PokemonTypes.grass.backgroundColor,
            ]
        case .partlyCloudy:
            return [
                PokemonTypes.rock.backgroundColor,
                PokemonTypes.normal.backgroundColor,
            ]
        case .cloudy:
            return [
                PokemonTypes.fairy.backgroundColor,
                PokemonTypes.poison.backgroundColor,
                PokemonTypes.fighting.backgroundColor,
            ]
        case .rainy:
            return [
                PokemonTypes.water.backgroundColor,
                PokemonTypes.bug.backgroundColor,
                PokemonTypes.electric.backgroundColor,
            ]
        case .windy:
            return [
                PokemonTypes.dragon.backgroundColor,
                PokemonTypes.flying.backgroundColor,
                PokemonTypes.psychic.backgroundColor,
            ]
        case .snow:
            return [
                PokemonTypes.ice.backgroundColor,
                PokemonTypes.steel.backgroundColor,
            ]
        case .fog:
            return [
                PokemonTypes.dark.backgroundColor,
                PokemonTypes.ghost.backgroundColor,
            ]
        }
    }
}
