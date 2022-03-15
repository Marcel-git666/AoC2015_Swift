//
//  day12.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 14.03.2022.
//

import Foundation

enum Day12 {
    static func run() {
        let input = readFile("Resources/day12.input")
        let numbersChars = CharacterSet.decimalDigits
        let minusChar = CharacterSet(charactersIn: "-")
        let specialChars = numbersChars.union(minusChar)
        
        print(input)
        let stringArray = input.components(separatedBy: specialChars.inverted).compactMap {Int($0)}.reduce(0,+)
        print(stringArray)
        
    }
}
