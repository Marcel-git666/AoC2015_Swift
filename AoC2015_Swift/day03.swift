//
//  day03.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 24.01.2022.
//

import Foundation

enum Day03 {
    static func run() {
        let input = readFile("Resources/day03.input")
        print(input)
        let allTheCity = LocatedHouse(x: 0, y: 0)
        let part1 = allTheCity.countHouses(input)
        print(part1)
        let part2 = allTheCity.countHousesRoboSanta(input)
        print(part2)
    }

    
}


struct LocatedHouse {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    func countHouses(_ input: String) -> Int {
        var xAxis = 0
        var yAxis = 0
        var locatedHouses: [LocatedHouse] = []
        let house = LocatedHouse(x: xAxis, y: yAxis)
        locatedHouses.append(house)
        for char in input {
            switch char {
            case "^":
                yAxis += 1
                let house = LocatedHouse(x: xAxis, y: yAxis)
                let found = locatedHouses.filter{$0.x == xAxis && $0.y == yAxis}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case "v":
                yAxis -= 1
                let house = LocatedHouse(x: xAxis, y: yAxis)
                let found = locatedHouses.filter{$0.x == xAxis && $0.y == yAxis}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case "<":
                xAxis -= 1
                let house = LocatedHouse(x: xAxis, y: yAxis)
                let found = locatedHouses.filter{$0.x == xAxis && $0.y == yAxis}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case ">":
                xAxis += 1
                let house = LocatedHouse(x: xAxis, y: yAxis)
                let found = locatedHouses.filter{$0.x == xAxis && $0.y == yAxis}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            default: print("End of File??")
            }
        }
        
        return locatedHouses.count
    }

    func countHousesRoboSanta(_ input: String) -> Int {
        var xAxisSanta = 0
        var yAxisSanta = 0
        var xAxisRoboSanta = 0
        var yAxisRoboSanta = 0
        var locatedHouses: [LocatedHouse] = []
        let house = LocatedHouse(x: xAxisSanta, y: yAxisSanta)
        locatedHouses.append(house)
        var instructions = input.startIndex
        var counter = 0
        while input[instructions] != "\n"   {
            switch input[instructions] {
            case "^":
                yAxisSanta += 1
                let house = LocatedHouse(x: xAxisSanta, y: yAxisSanta)
                let found = locatedHouses.filter{$0.x == xAxisSanta && $0.y == yAxisSanta}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case "v":
                yAxisSanta -= 1
                let house = LocatedHouse(x: xAxisSanta, y: yAxisSanta)
                let found = locatedHouses.filter{$0.x == xAxisSanta && $0.y == yAxisSanta}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case "<":
                xAxisSanta -= 1
                let house = LocatedHouse(x: xAxisSanta, y: yAxisSanta)
                let found = locatedHouses.filter{$0.x == xAxisSanta && $0.y == yAxisSanta}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case ">":
                xAxisSanta += 1
                let house = LocatedHouse(x: xAxisSanta, y: yAxisSanta)
                let found = locatedHouses.filter{$0.x == xAxisSanta && $0.y == yAxisSanta}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            default: print("End of File??")
            }
            counter += 1
            instructions = input.index(input.startIndex, offsetBy: counter)
            switch input[instructions] {
            case "\n": continue
            case "^":
                yAxisRoboSanta += 1
                let house = LocatedHouse(x: xAxisRoboSanta, y: yAxisRoboSanta)
                let found = locatedHouses.filter{$0.x == xAxisRoboSanta && $0.y == yAxisRoboSanta}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case "v":
                yAxisRoboSanta -= 1
                let house = LocatedHouse(x: xAxisRoboSanta, y: yAxisRoboSanta)
                let found = locatedHouses.filter{$0.x == xAxisRoboSanta && $0.y == yAxisRoboSanta}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case "<":
                xAxisRoboSanta -= 1
                let house = LocatedHouse(x: xAxisRoboSanta, y: yAxisRoboSanta)
                let found = locatedHouses.filter{$0.x == xAxisRoboSanta && $0.y == yAxisRoboSanta}.count > 0
                if !found {
                    locatedHouses.append(house)
                }
            case ">":
                xAxisRoboSanta += 1
                let house = LocatedHouse(x: xAxisRoboSanta, y: yAxisRoboSanta)
                let found = locatedHouses.filter{$0.x == xAxisRoboSanta && $0.y == yAxisRoboSanta}.count > 0
                if !found {
                    locatedHouses.append(house)

                }
            default: print("End of File??")
            }
            counter += 1
            instructions = input.index(input.startIndex, offsetBy: counter)
            
        }
       
        return locatedHouses.count
    }

}

