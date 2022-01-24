//
//  day02.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 22.01.2022.
//

import Foundation

enum Day02 {
    static func run() {
        let input = readFile("Resources/day02.input")
        print(input)
        let lines = input.lines
        print(lines)
        var array : [Int] = []
        for line in lines {
            let parts = line.split(separator: "x").map {$0.trimmingCharacters(in: .whitespacesAndNewlines)}
            for part in parts {
                let x = Int(part) ?? 0
                array.append(x)
            }
        }
        print(array)
        
        print(part1(array))
        print(part2(array))
    }


    static func part1(_ input: [Int]) -> Int {
        var counter = 0
        var sum = 0
        while counter < input.count {
            sum += Package.init(length: input[counter], height: input[counter+1], width: input[counter+2]).areaForPackage
            counter += 3
        }
        
        return sum
    }
    static func part2(_ input: [Int]) -> Int {
        var counter = 0
        var sum = 0
        while counter < input.count {
            sum += Package.init(length: input[counter], height: input[counter+1], width: input[counter+2]).lengthOfRibbon
            counter += 3
        }
        
        return sum
    }
    
}


struct Package {
    let l: Int
    let h: Int
    let w: Int
    
    init(length: Int, height: Int, width: Int) {
        self.l = length
        self.h = height
        self.w = width
    }
    var areaForPackage: Int {
        2*l*w + 2*w*h + 2*h*l + l*w*h/max(h, w, l)
    }
    var lengthOfRibbon: Int {
        2*(l+w+h-max(l, w, h))+l*w*h
    }
}

