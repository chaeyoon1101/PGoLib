//
//  PokemonGoManager.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 3/27/24.
//

import Foundation
import SwiftSoup

final class PokemonGoManager {
    static let decoder = JSONDecoder()

    static func fetchLeagueData(type: BattleLeagueTypes) async throws -> BattleLeague {
        guard let url = URL(string: type.url) else {
            throw ErrorCases.invaildURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invaildResponse
        }
        
        do {
            resetRankCount()
            return try decoder.decode(BattleLeague.self, from: data)
        } catch {
            print(error.localizedDescription)
            throw ErrorCases.invaildData
        }
    }
    
    static func fetchPokemonTierData() async throws -> [PokemonTier] {
        guard let url = URL(string: "https://poketory.com/pokemongo_tier") else {
            throw ErrorCases.invaildURL
        }
        
        let types: [PokemonTypes] = [
            .normal, .ice, .dark, .ghost, .ground, .rock, .fairy, .fighting, .electric,
            .dragon, .bug, .grass, .water, .fire, .poison, .steel, .psychic, .flying
        ]
        
        var tiers = [PokemonTier]()
        
        var lastTier: Tier?
        
        do {
            let webString = try String(contentsOf: url)
            let document = try SwiftSoup.parse(webString)
            
            let figures = try document.select("figure.wp-block-flexible-table-block-table")
            var currentTier = Rank.glassCannon
            
            for index in 1..<figures.count {
                let type = types[index]
                var tierList = [Tier]()

                let rows = try figures[index].select("tbody > tr")
                
                for row in rows {
                    let columns = try row.select("td")
                    
                    if columns.count < 4 {
                        var hasName = false
                        var hasMove = false
                        var hasDps = false
                        var hasTdo = false
                        
                        var count = 0
                        
                        for col in columns {
                            let col = try col.text()
                            hasMove = col.contains("/")
                            hasDps = col.contains("%") || col.contains("-")
                            hasTdo = hasDps
                        }
                        
                        hasName = !(hasMove && hasDps && hasTdo)
                        
                        if let tier = lastTier {
                            let name = hasName ? try columns[count].text() : tier.name
                            count = hasName ? count + 1 : count
                            
                            let move = hasMove ? try columns[count].text() : tier.move
                            count = hasMove ? count + 1 : count
                            
                            let dps = hasDps ? try columns[count].text() : tier.dps
                            count = hasDps ? count + 1 : count
                            
                            let tdo = hasTdo ? try columns[count].text() : tier.tdo

                            let tier = Tier(rank: currentTier, name: name, move: move, dps: dps, tdo: tdo)
                            
                            lastTier = tier
                            tierList.append(tier)
                        }
                        
                        continue
                    }

                    if columns.count == 5 {
                        currentTier = Rank(rawValue: try columns[0].text()) ?? .b
                    }
                    
                    let name = try columns[columns.count - 4].text()
                    let move = try columns[columns.count - 3].text()
                    let dps = try columns[columns.count - 2].text()
                    let tdo = try columns[columns.count - 1].text()
                    
                    let tier = Tier(rank: currentTier, name: name, move: move, dps: dps, tdo: tdo)
                    
                    lastTier = tier
                    tierList.append(tier)
                }
                
                tiers.append(PokemonTier(type: type, tierList: tierList))
            }
            
            return tiers
        } catch let error {
            print(error.localizedDescription)
            throw ErrorCases.invaildData
        }
    }
}

enum ErrorCases: LocalizedError {
    case invaildURL
    case invaildResponse
    case invaildData
    case invaildCssQuery
}
