//
//  Extension+Double.swift
//  PGoLib
//
//  Created by 임채윤 on 8/17/24.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let multiplier = pow(10.0, Double(places))
        return floor(self * multiplier) / multiplier
    }
}
