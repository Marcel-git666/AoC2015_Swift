//
//  day08.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 05.02.2022.
//

import Foundation

enum Day08 {
    static func run() {
        let input = readFile("Resources/day08.test")
        
        let lines = input.lines
        print(lines)
        for line in lines {
            print("Lajna \(line) je dlouhá \(line.count) znaků.")
            var counter = 0
            for (index, value) in line.enumerated() {
                let ind = index
                switch value {
                case "\\": switch line[ind+1] {
                                case "x": continue
                                default: counter += 1
                                        
                            }
                default: counter += 1
                }
            }
        }
        print("Konec")
    }

}
