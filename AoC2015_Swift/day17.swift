//
//  day17.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 08.08.2022.
//

import Foundation

enum Day17 {
    static func run() {
    
        
        let input = readFile("Resources/day17.input")
        let inputArray = input.lines
        var array: [Int] = []
        for line in inputArray {
            array.append(Int(line)!)
        }
            
        let combinations = array.combinationsWithoutRepetition
        var numberOfCombinations = 0
        var lowestNumberArray: [Int] = []
        for line in combinations {
            let soucet = line.reduce(0, +)
            let lowestNumber = line.count
            if soucet == 150 {
                print(line)
                lowestNumberArray.append(line.count)
                numberOfCombinations += 1
            }
        }
        print("Part 1:", numberOfCombinations)
        print("Part 2:", lowestNumberArray.filter{$0 == lowestNumberArray.min()}.count)
//        array.filter{$0 == element}.count
        }
}
