//
//  day19.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 29.10.2022.
//

import Foundation

enum Day19 {
    static func run() {
        let input = readFile("Resources/day19.test")
        let lines = input.lines
        
        print(lines)
        for line in lines {
            let components = line.split(separator: " ")
            print(components)
        }
        
    }
    
}
