//
//  util.swift
//  AoC2021
//
//  Created by Marcel Mravec on 17.12.2021.
//

import Foundation

func readFile(_ name:String) ->  String {
    let projectURL = URL(fileURLWithPath: #file).deletingLastPathComponent()
    let fileURL = projectURL.appendingPathComponent(name)
    let data = try! Data(contentsOf: fileURL)
    return String(data: data, encoding: .utf8)!
}


extension String {
    var lines: [String] {
    split(separator: "\n").map { $0.trimmingCharacters(in: .whitespaces) }
    }
}


extension Int {
    init?(_ s: Substring) {
        guard let int = Int(String(s)) else { return nil }
            self = int
    
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension Array {
    var combinationsWithoutRepetition: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(self[1...]).combinationsWithoutRepetition.flatMap { [$0, [self[0]] + $0] }
    }
}
