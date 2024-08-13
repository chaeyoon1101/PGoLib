import Foundation
import SwiftUI

struct BattleLeagueTiers {
    var littleLeague = BattleLeague()
    var greatLeague = BattleLeague()
    var ultraLeague = BattleLeague()
    var masterLeague = BattleLeague()
    
    func data(index: Int) -> BattleLeague {
        guard let type = BattleLeagueTypes(rawValue: index) else {
            return littleLeague
        }
        
        switch type {
        case .littleLeague:
            return littleLeague
        case .greatLeague:
            return greatLeague
        case .ultraLeague:
            return ultraLeague
        case .masterLeague:
            return masterLeague
        }
    }
    
    func data(type: BattleLeagueTypes) -> BattleLeague {
        switch type {
        case .littleLeague:
            return littleLeague
        case .greatLeague:
            return greatLeague
        case .ultraLeague:
            return ultraLeague
        case .masterLeague:
            return masterLeague
        }
    }
}

enum BattleLeagueTypes: Int, CaseIterable {
    case littleLeague = 0
    case greatLeague
    case ultraLeague
    case masterLeague
    
    var url: String {
        switch self {
        case .littleLeague:
            return "https://pvpoke.com/data/rankings/all/overall/rankings-500.json"
        case .greatLeague:
            return "https://pvpoke.com/data/rankings/all/overall/rankings-1500.json"
        case .ultraLeague:
            return "https://pvpoke.com/data/rankings/all/overall/rankings-2500.json"
        case .masterLeague:
            return "https://pvpoke.com/data/rankings/all/overall/rankings-10000.json"
        }
    }
    
    var name: String {
        switch self {
        case .littleLeague:
            return "리틀컵"
        case .greatLeague:
            return "슈퍼리그"
        case .ultraLeague:
            return "하이퍼리그"
        case .masterLeague:
            return "마스터리그"
        }
    }
    
    static var segments: [String] {
        return allCases.map { $0.name }
    }
}
