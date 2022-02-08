//
//  day07.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 02.02.2022.
//

import Foundation

enum Day07 {
    static func run() {
        let input = readFile("Resources/day07.test")
        let lines = input.lines
        var primaryInstructions = [String]()
        for line in lines {
            print("Lajna je \(line) a má \(line.components(separatedBy: " ").count) komponent.")
            if line.components(separatedBy: " ").count == 3 {
                primaryInstructions.append(line)
            }
        }
        print(primaryInstructions)
        print("Prošli jsme \(input.lines.count) řetězců.")
        print("Konec")
    }

}

struct Wires {
    let name: String
    
}


func bitwiseMethods(method: String, a: Int, b: Int) -> Int  {
    switch(method) {
    case "AND": return a & b
    case "OR": return a | b
    case "NOT": return ~a
    case "LSHIFT": return a << b
    case "RSHIFT": return a >> b
    default: return 0
    }
}
