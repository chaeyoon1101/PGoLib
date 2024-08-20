//
//  DataModel.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 3/27/24.
//

import Foundation
import SwiftSoup

class DataModel: ObservableObject {
    @Published var pokemons: Pokemon = []
    @Published var pokemonTiers: [PokemonTier] = []
    @Published var battleLeagueTiers = BattleLeagueTiers()
    
    func fetchDatas() async {
//        await fetchPokemonTiers()
        await fetchPokemons()
//        await fetchBattleLeagueTiers()
    }
    
    func fetchPokemons() async {
        do {
            let pokemons = try await PokemonGoManager.fetchPokemonData()
            
            DispatchQueue.main.async {
                self.pokemons = pokemons
                
                print("포켓몬 데이터 가져옴")
            }
        } catch let error {
            print(error)
        }
    }
    
    func fetchBattleLeagueTiers() async {
        do {
            let littleLeagueData = try await PokemonGoManager.fetchLeagueData(type: .littleLeague)
            let greatLeagueData = try await PokemonGoManager.fetchLeagueData(type: .greatLeague)
            let ultraLeagueData = try await PokemonGoManager.fetchLeagueData(type: .ultraLeague)
            let masterLeagueData = try await PokemonGoManager.fetchLeagueData(type: .masterLeague)
            
            DispatchQueue.main.async {
                self.battleLeagueTiers.littleLeague = littleLeagueData
                self.battleLeagueTiers.greatLeague = greatLeagueData
                self.battleLeagueTiers.ultraLeague = ultraLeagueData
                self.battleLeagueTiers.masterLeague = masterLeagueData
                
                print("배틀 리그 티어 데이터 가져옴")
            }
        } catch let error {
            print(error)
        }
    }
    
    func fetchPokemonTiers() async {
        do {
            let pokemonTiers = try await PokemonGoManager.fetchPokemonTierData()
            
            DispatchQueue.main.async {
                self.pokemonTiers = pokemonTiers
            }
            
            print("포켓몬 레이드 티어 가져옴")
        } catch let error {
            print(error)
        }
    }
    
    func findPokemon(id: String) -> PokemonElement? {
        var pokemon: PokemonElement?
        
        let splitedId = id.split(separator: "_").map { String($0) }
        var storedId: [String] = []
        
        let localize = Localize()
        
        for id in splitedId {
            storedId.append(id)
            
            if let dexNumber = localize.dexNumbers[storedId.joined(separator: "_")] {
                if dexNumber < 902 {
                    pokemon = pokemons[dexNumber - 1]
                } else {
                    pokemon = pokemons[dexNumber - 2]
                }
                
                break
            }
        }
        
        return pokemon
    }
}
