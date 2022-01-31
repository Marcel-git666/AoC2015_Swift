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
//        let input = readFile("Resources/day06.test")
        var xmasHouseGrid = Grid(gridSize: 20)
        print(xmasHouseGrid.debugDescription)
        xmasHouseGrid.toggleLights(fromX: 1, fromY: 1, toX: 5, toY: 5)
        print(xmasHouseGrid.debugDescription)
        xmasHouseGrid.toggleLights(fromX: 1, fromY: 1, toX: 5, toY: 5)
        print(xmasHouseGrid.debugDescription)
        xmasHouseGrid.toggleLights(fromX: 4, fromY: 1, toX: 15, toY: 5)
        print(xmasHouseGrid.debugDescription)
        xmasHouseGrid.turnTheLightsOn(fromX: 6, fromY: 0, toX: 10, toY: 10)
        print(xmasHouseGrid.debugDescription)
        xmasHouseGrid.turnTheLightsOff(fromX: 7, fromY: 3, toX: 7, toY: 3)
        print(xmasHouseGrid.debugDescription)
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
            
                s += grid[row*size+col].debugDescription
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
