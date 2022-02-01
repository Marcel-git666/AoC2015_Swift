//
//  day06.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 28.01.2022.
//


//let colorString = "☀️"
//let bwString = "☀︎"


import Foundation

enum Day06 {
    static func run() {
        let input = readFile("Resources/day06.input")
        var xmasHouseGrid = Grid(gridSize: 1000)
        let lines = input.lines
        print(lines)
        for line in lines {
            let parts = line.components(separatedBy: " ")
            switch parts[0] {
            case "toggle": let fromXY = parts[1].components(separatedBy: ",")
                let toXY = parts[3].components(separatedBy: ",")
                print("Tisknu snad fromXY - \(fromXY) a toXY \(toXY)")
                let beginX = Int(fromXY[0]) ?? 0
                let beginY = Int(fromXY[1]) ?? 0
                let endX = Int(toXY[0]) ?? 0
                let endY = Int(toXY[1]) ?? 0
                print(beginX, beginY, endX, endY)
                xmasHouseGrid.toggleLights(fromX: beginX, fromY: beginY, toX: endX, toY: endY)
            case "turn":
                switch parts[1] {
                case "on": let fromXY = parts[2].components(separatedBy: ",")
                    let toXY = parts[4].components(separatedBy: ",")
                    print("Tisknu snad fromXY - \(fromXY) a toXY \(toXY)")
                    let beginX = Int(fromXY[0]) ?? 0
                    let beginY = Int(fromXY[1]) ?? 0
                    let endX = Int(toXY[0]) ?? 0
                    let endY = Int(toXY[1]) ?? 0
                    print(beginX, beginY, endX, endY)
                    xmasHouseGrid.turnTheLightsOn(fromX: beginX, fromY: beginY, toX: endX, toY: endY)
                case "off": let fromXY = parts[2].components(separatedBy: ",")
                    let toXY = parts[4].components(separatedBy: ",")
                    print("Tisknu snad fromXY - \(fromXY) a toXY \(toXY)")
                    let beginX = Int(fromXY[0]) ?? 0
                    let beginY = Int(fromXY[1]) ?? 0
                    let endX = Int(toXY[0]) ?? 0
                    let endY = Int(toXY[1]) ?? 0
                    print(beginX, beginY, endX, endY)
                    xmasHouseGrid.turnTheLightsOff(fromX: beginX, fromY: beginY, toX: endX, toY: endY)
                default: print(parts[1])
                }
            default: print(parts)
            }
        }
        print(xmasHouseGrid.grid.filter {$0.isGlowing == true}.count)
        print("Konec")
    }

}

struct House {
    
    var isGlowing: Bool
    init(_ isGlowing: Bool = false) {
        
        self.isGlowing = isGlowing
    }
    func glow() -> Self {
        .init(true)
    }
    
    var debugDescription: String {
        "\(isGlowing ? "☀️" : "⚾️")"
    }
}

struct Grid {
    var grid: [House]
    let size: Int
    
    init(gridSize: Int) {
        grid = Array(repeating: false, count: gridSize*gridSize).map { House($0) }
        size = gridSize
    }
    var debugDescription: String {
        var s = ""
        print("Začátek výpisu \(s) size: \(size)")
        for row in 0..<size {
            for col in 0..<size {
            
                s += grid[col*size+row].debugDescription
            }
                s += "\n"
        }
        
        
        s += "\n"
        return s
    }
    mutating func toggleLights(fromX: Int, fromY: Int, toX: Int, toY: Int) {
        
        
        for row in fromX...toX {
            for col in fromY...toY {
                grid[row*size+col].isGlowing.toggle()
            }
        }
        
    }
    
    mutating func turnTheLightsOn(fromX: Int, fromY: Int, toX: Int, toY: Int) {
        
        
        for row in fromX...toX {
            for col in fromY...toY {
                grid[row*size+col].isGlowing = true
            }
        }
        
    }
    
    mutating func turnTheLightsOff(fromX: Int, fromY: Int, toX: Int, toY: Int) {
        
        
        for row in fromX...toX {
            for col in fromY...toY {
                grid[row*size+col].isGlowing = false
            }
        }
        
    }
}
