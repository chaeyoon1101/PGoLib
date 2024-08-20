//
//  Extension+String.swift
//  PGoLib
//
//  Created by 임채윤 on 8/20/24.
//

import Foundation

extension String {
    func padEnd(toLength newLength: Int, withPad padString: String) -> String {
        var newString = ""
        
        while newString.count < (newLength - self.count) {
            newString += padString
        }
        
        return newString + self
    }
}
