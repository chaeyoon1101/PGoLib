//
//  DataBase.swift
//  PGoLib
//
//  Created by 임채윤 on 8/21/24.
//

import Foundation
import UIKit

final class DataManager {
    static let shared = DataManager()
    
    private let decoder = JSONDecoder()
    
    private init() {
        loadCPData()
    }
    
    private var pokemonCPDataPerLevel: [String: [String]] = [:]
    
    func getCPData(_ dexNumber: Int, _ formID: String) -> [String] {
        guard let cpData = pokemonCPDataPerLevel[String(dexNumber)] else {
            return []
        }
        
        if cpData.count < 50, let cpData = pokemonCPDataPerLevel[String(dexNumber) + formID] {
            return cpData
        }
        
        return cpData
    }
    
    private func loadCPData() {
        if let asset = NSDataAsset.init(name: "PokemonCPData") {
            do {
                self.pokemonCPDataPerLevel = try decoder.decode([String: [String]].self, from: asset.data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
