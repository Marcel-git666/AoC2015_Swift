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
        var wires: Wires
        wires = .init(map: [:])
        let wireMap = wires.performInstruction(key: "x", lines: lines)
        print(wireMap)
        print("Prošli jsme \(input.lines.count) řetězců.")
        print("Konec")
    }

}

struct Wires {
    var map: [String: Int] = [:]

    init(map: [String: Int]) {
        self.map = map
    }
    mutating func performInstruction(key: String, lines: [String]) -> [String: Int] {
        for line in lines {
            let components = line.components(separatedBy: "->")
            print("Key je \(key) a komponenta1 je \(components[1].trimmingCharacters(in: .whitespaces)).")
            if components[1].trimmingCharacters(in: .whitespaces) == key {
                let left = Int(components[0].trimmingCharacters(in: .whitespaces)) ?? nil
                print("Left je \(left).")
                if left != nil {
                    print("left není nil")
                    map[key] = decodeNumber(number: left!)
                }
            }
        }
        return map
    }
    func decodeNumber(number: Int) -> Int {
        return 1
    }
}




//func bitwiseMethods(method: String, a: Int, b: Int) -> Int  {
//    switch(method) {
//    case "AND": return a & b
//    case "OR": return a | b
//    case "NOT": return ~a
//    case "LSHIFT": return a << b
//    case "RSHIFT": return a >> b
//    default: return 0
//    }
//}
