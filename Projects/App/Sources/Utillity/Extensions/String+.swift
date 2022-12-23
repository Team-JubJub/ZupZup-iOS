//
//  String+.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/21.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

extension String {

    var hasValidPhoneNumber: Bool {
        return self.range(of: "^01[0-1, 7]-[0-9]{3,4}-[0-9]{4}$",
                      options: String.CompareOptions.regularExpression,
                      range: nil, locale: nil) != nil
    }
    
    var decimalFilteredString: String {
        return String(unicodeScalars.filter(CharacterSet.decimalDigits.contains))
    }
    
    func formated(by patternString: String) -> String {
        let digit: Character = "#"
 
        let pattern: [Character] = Array(patternString)
        let input: [Character] = Array(self.decimalFilteredString)
        var formatted: [Character] = []
 
        var patternIndex = 0
        var inputIndex = 0
 
        while inputIndex < input.count {
            let inputCharacter = input[inputIndex]
            guard patternIndex < pattern.count else { break }
 
            switch pattern[patternIndex] == digit {
            case true:
                formatted.append(inputCharacter)
                inputIndex += 1
            case false:
                formatted.append(pattern[patternIndex])
            }
            patternIndex += 1
        }
        return String(formatted)
    }
}
