// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemon = try? JSONDecoder().decode(Pokemon.self, from: jsonData)

import Foundation

typealias Pokemon = [PokemonElement]

struct PokemonElement: Decodable, Identifiable {
    let id: String
    let formID: String
    let dexNumber: Int
    let generation: Int
    let names: Names
    let stats: PokemonStats?
    let types: [PokemonTypes]
    let primaryType: PokemonType
    let secondaryType: PokemonType?
    let pokemonClass: String?
    let quickMoves: [String: PokemonMove]?
    let cinematicMoves: [String: PokemonMove]?
    let eliteQuickMoves: [String: PokemonMove]?
    let eliteCinematicMoves: [String: PokemonMove]?
    let assets: Assets?
    let assetForms: [AssetWithType]
    let regionForms: [String: RegionPokemon]?
    let evolutions: [Evolution]
    let hasMegaEvolution: Bool
    let megaEvolutions: [String: MegaEvolution]?
    
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.formID = try container.decode(String.self, forKey: .formID)
        self.dexNumber = try container.decode(Int.self, forKey: .dexNumber)
        self.generation = try container.decode(Int.self, forKey: .generation)
        self.names = try container.decode(Names.self, forKey: .names)
        self.primaryType = try container.decode(PokemonType.self, forKey: .primaryType)
        self.secondaryType = try container.decodeIfPresent(PokemonType.self, forKey: .secondaryType)
        self.pokemonClass = try container.decodeIfPresent(String.self, forKey: .pokemonClass)
        self.assetForms = try container.decode([AssetWithType].self, forKey: .assetForms)
        self.evolutions = try container.decode([Evolution].self, forKey: .evolutions)
        self.hasMegaEvolution = try container.decode(Bool.self, forKey: .hasMegaEvolution)
        
        self.stats = try? container.decode(PokemonStats.self, forKey: .stats)
        self.quickMoves = try? container.decodeIfPresent([String : PokemonMove].self, forKey: .quickMoves)
        self.cinematicMoves = try? container.decode([String: PokemonMove].self, forKey: .cinematicMoves)
        self.eliteQuickMoves = try? container.decode([String: PokemonMove].self, forKey: .eliteQuickMoves)
        self.eliteCinematicMoves = try? container.decode([String: PokemonMove].self, forKey: .eliteCinematicMoves)
        self.assets = try? container.decode(Assets.self, forKey: .assets)
        self.regionForms = try? container.decodeIfPresent([String: RegionPokemon].self, forKey: .regionForms)
        self.megaEvolutions = try? container.decodeIfPresent([String: MegaEvolution].self, forKey: .megaEvolutions)
        
        self.types = PokemonElement.normalizedTypes(primaryType: self.primaryType, secondaryType: self.secondaryType)
    }
    
    enum CodingKeys: String, CodingKey {
        case formID = "formId"
        case dexNumber = "dexNr"
        case id, generation, names, stats, primaryType, secondaryType, pokemonClass, quickMoves, cinematicMoves, eliteQuickMoves, eliteCinematicMoves, assets, assetForms, regionForms, evolutions, hasMegaEvolution, megaEvolutions
    }
    
    static func normalizedTypes(primaryType: PokemonType, secondaryType: PokemonType?) -> [PokemonTypes] {
        var types = [PokemonTypes]()
        
        types.append(PokemonTypes(rawValue: primaryType.type) ?? .normal)
        
        if let secondaryType = secondaryType {
            types.append(PokemonTypes(rawValue: secondaryType.type) ?? .normal)
        }
        
        return types
    }
}

struct RegionPokemon: Decodable {
    let id: String
    let formID: String
    let dexNumber: Int
    let generation: Int
    let names: Names
    let stats: PokemonStats?
    let primaryType: PokemonType
    let secondaryType: PokemonType?
    let pokemonClass: String?
    let quickMoves: [String: PokemonMove]?
    let cinematicMoves: [String: PokemonMove]?
    let eliteQuickMoves: [String: PokemonMove]?
    let eliteCinematicMoves: [String: PokemonMove]?
    let assets: Assets?
    let regionForms: [String: RegionPokemon]?
    let evolutions: [Evolution]
    let hasMegaEvolution: Bool
    let megaEvolutions: [String: MegaEvolution]?
    
    enum CodingKeys: String, CodingKey {
        case formID = "formId"
        case dexNumber = "dexNr"
        case id, generation, names, stats, primaryType, secondaryType, pokemonClass, quickMoves, cinematicMoves, eliteQuickMoves, eliteCinematicMoves, assets, regionForms, evolutions, hasMegaEvolution, megaEvolutions
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.formID = try container.decode(String.self, forKey: .formID)
        self.dexNumber = try container.decode(Int.self, forKey: .dexNumber)
        self.generation = try container.decode(Int.self, forKey: .generation)
        self.names = try container.decode(Names.self, forKey: .names)
        self.primaryType = try container.decode(PokemonType.self, forKey: .primaryType)
        self.secondaryType = try container.decodeIfPresent(PokemonType.self, forKey: .secondaryType)
        self.pokemonClass = try container.decodeIfPresent(String.self, forKey: .pokemonClass)
        self.assets = try? container.decode(Assets.self, forKey: .assets)
        self.evolutions = try container.decode([Evolution].self, forKey: .evolutions)
        self.hasMegaEvolution = try container.decode(Bool.self, forKey: .hasMegaEvolution)
        
        self.stats = try? container.decode(PokemonStats.self, forKey: .stats)
        self.quickMoves = try? container.decodeIfPresent([String : PokemonMove].self, forKey: .quickMoves)
        self.cinematicMoves = try? container.decode([String: PokemonMove].self, forKey: .cinematicMoves)
        self.eliteQuickMoves = try? container.decode([String: PokemonMove].self, forKey: .eliteQuickMoves)
        self.eliteCinematicMoves = try? container.decode([String: PokemonMove].self, forKey: .eliteCinematicMoves)
        self.regionForms = try? container.decodeIfPresent([String: RegionPokemon].self, forKey: .regionForms)
        self.megaEvolutions = try? container.decodeIfPresent([String: MegaEvolution].self, forKey: .megaEvolutions)
    }
}

struct MegaEvolution: Decodable {
    let id: String
    let names: Names
    let stats: PokemonStats
    let primaryType: PokemonType
    let secondaryType: PokemonType?
    let assets: Assets
}

struct Evolution: Decodable {
    let id: String
    let formID: String
    let candies: Int
    let item: Item?
    let quests: [Quests]
    
    enum CodingKeys: String, CodingKey {
        case id
        case formID = "formId"
        case candies
        case item
        case quests
    }
}

struct Quests: Decodable {
    let id: String
    let type: String
    let names: Names
}

struct Item: Decodable {
    let id: String
    let names: Names
}

struct AssetWithType: Decodable {
    let image: String
    let shinyImage: String
    let form: String?
    let costume: String?
    let isFemale: Bool
}

struct Assets: Decodable {
    let image: String
    let shinyImage: String
}

struct PokemonMove: Decodable {
    let id: String
    let power: Int
    let energy: Int
    let durationMS: Int
    let type: PokemonType
    let names: Names
    let combat: Combat?
    
    enum CodingKeys: String, CodingKey {
        case id
        case power
        case energy
        case durationMS = "durationMs"
        case type
        case names
        case combat
    }
}

struct Combat: Decodable {
    let energy: Int
    let power: Int
    let turns: Int
    let buffs: Buffs?
}

struct Buffs: Decodable {
    let activationChance: Int
    let attackerAttackStatsChange: Int?
    let attackerDefenseStatsChange: Int?
    let targetAttackStatsChange: Int?
    let targetDefenseStatsChange: Int?
}

struct PokemonType: Decodable {
    let type: String
    let names: Names
}

struct PokemonStats: Decodable {
    let stamina: Int
    let attack: Int
    let defense: Int
}

struct Names: Decodable {
    var languages: [Language: String] = [:]
    
    enum Language: String {
        case english = "English"
        case german = "German"
        case french = "French"
        case italian = "Italian"
        case japanese = "Japanese"
        case korean = "Korean"
        case spanish = "Spanish"
    }
    
    func localized() -> String {
        return languages[.korean] ?? ""
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        for key in container.allKeys {
            if let language = Names.Language(rawValue: key.stringValue) {
                languages[language] = try container.decode(String.self, forKey: key)
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case english = "English"
        case german = "German"
        case french = "French"
        case italian = "Italian"
        case japanese = "Japanese"
        case korean = "Korean"
        case spanish = "Spanish"
    }
}
