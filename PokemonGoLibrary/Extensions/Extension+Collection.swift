//
//  Extension+Collection.swift
//  PGoLib
//
//  Created by 임채윤 on 8/17/24.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
