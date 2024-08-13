import Foundation

var rankCount = 1

struct BattleLeagueElement: Decodable {
    let uid: UUID = UUID()
    let id: String
    let name: String
    let matchups: [Matchup]
    let counters: [Counter]
    let moves: Moves
    let moveset: [String]
    let stats: Stats
    let rank: Int
    let isShadow: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "speciesId"
        case name = "speciesName"
        case matchups, counters, moves, moveset, stats
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let normalizedData = BattleLeagueElement.normalizedData(id: try container.decode(String.self, forKey: .id))
            
        self.id = normalizedData.id
        self.name = normalizedData.name
        self.isShadow = normalizedData.isShadow
        
        self.matchups = try container.decode([Matchup].self, forKey: .matchups)
        self.counters = try container.decode([Counter].self, forKey: .counters)
        self.moves = try container.decode(Moves.self, forKey: .moves)
        self.moveset = try container.decode([String].self, forKey: .moveset)
        self.stats = try container.decode(Stats.self, forKey: .stats)
        
        self.rank = rankCount
        rankCount += 1
    }
    
    static private func normalizedData(id: String) -> NormalizedData {
        var isShadow: Bool = false
        
        let splitedID = id.split(separator: "_").map { String($0) }
        var storedID = [String]()
        
        for id in splitedID {
            if let normalizedForm = normalizedForms[id] {
                storedID.append(normalizedForm.uppercased())
            } else if id == "shadow" {
                isShadow = true
            } else {
                storedID.append(id.uppercased())
            }
        }
        
        let normalizedID = storedID.joined(separator: "_")
        
        let localizedName = Localize().localized(pokemon: normalizedID, isShadow: isShadow)
        
        return NormalizedData(id: normalizedID, name: localizedName, isShadow: isShadow)
    }
    
    static private let normalizedForms = [
        "alolan": "alola",
        "paldean": "paldea",
    ]
}

struct NormalizedData {
    let id: String
    let name: String
    let isShadow: Bool
}

struct Matchup: Decodable {
    let opponent: String
}

struct Counter: Decodable {
    let opponent: String
}

struct Moves: Decodable {
    let fastMoves: [Move]
    let chargedMoves: [Move]
}

struct Move: Decodable {
    let id: String
    let uses: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "moveId"
        case uses = "uses"
    }
}

struct Stats: Decodable {
    let maxCP: Int
    let attack: Double
    let defense: Double
    let hp: Int
    
    enum CodingKeys: String, CodingKey {
        case maxCP = "product"
        case attack = "atk"
        case defense = "def"
        case hp
    }
}

typealias BattleLeague = [BattleLeagueElement]

func resetRankCount() {
    rankCount = 1
}
