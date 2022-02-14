//
//  day08.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 05.02.2022.
//

import Foundation

enum Day08 {
    static func run() {
        let input = readFile("Resources/day08.input")
        
        let lines = input.lines
//         print(lines)
        let result = part1day8(lines: lines)
        print(result)
        print("PART 2:")
        let result2 = part2day8(lines: lines)
        print(result2)
        print("Konec")
    }

}

func part1day8(lines: [String]) -> Int {
    var counter = 0
    
    for line in lines {
//        print("Lajna \(line) je dlouhá \(line.count) znaků.")
        counter += line.count
        
    }
    
    print("Celkem máme \(counter) znaků.")
    
    var counter2 = 0
    for line in lines {
        var offSet = 0
        var numberOfCharacters = 0

        while offSet < line.count {
            let index = line.index(line.startIndex, offsetBy: offSet)
            switch line[index] {
            case "\\": let nextIndex = line.index(line.startIndex, offsetBy: offSet + 1)
                if line[nextIndex] == "x" {
                    offSet += 4
                    numberOfCharacters += 1
                } else {
                    offSet += 2
                    numberOfCharacters += 1
                }
            default: numberOfCharacters += 1
                offSet += 1
                
            }
        }
        numberOfCharacters -= 2 //odečítám první a poslední uvozovky
//        print("Počet znaků v \(line) je \(numberOfCharacters).")
        counter2 += numberOfCharacters
    }
    
    print("Zajímá nás rozdíl \(counter - counter2).")
    return counter - counter2
}

func part2day8(lines: [String]) -> Int {
    var counter = 0
    
    for line in lines {
//        print("Lajna \(line) je dlouhá \(line.count) znaků.")
        counter += line.count
        
    }
    
    print("Celkem v part 2 máme \(counter) znaků.")
    
    var counter2 = 0
    for line in lines {
        var offSet = 0
        var numberOfCharacters = 0

        while offSet < line.count {
            let index = line.index(line.startIndex, offsetBy: offSet)
            switch line[index] {
            case "\\": let nextIndex = line.index(line.startIndex, offsetBy: offSet + 1)
                if line[nextIndex] == "x" {
                    offSet += 4
                    numberOfCharacters += 5
                } else {
                    offSet += 1
                    numberOfCharacters += 2
                }
            case "\"": numberOfCharacters += 2
                offSet += 1
            default: numberOfCharacters += 1
                offSet += 1
                
            }
        }
        numberOfCharacters += 2 //zdvojím první a poslední uvozovky
//        print("Počet znaků v \(line) je \(numberOfCharacters).")
        counter2 += numberOfCharacters
    }
    print("Counter 2 je \(counter2)")
    print("Zajímá nás rozdíl \(counter2 - counter).")
    return counter2 - counter
}
