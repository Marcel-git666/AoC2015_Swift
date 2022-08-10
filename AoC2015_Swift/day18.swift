//
//  day18.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 09.08.2022.
//

import Foundation

enum Day18 {
    static func run() {
        let input = readFile("Resources/day18.input")
        let lines = input.lines
        let gridSize = lines.count
        var array: [[String]] = []
        
        print(lines)
        for line in lines {
            let characters = line.map { String($0) }
            print(characters)
            array.append(characters)
        }
        print(array)
        var strangeLights = LightGrid(gridSize: gridSize)
        for row in 0..<gridSize {
            for col in 0..<gridSize {
                switch array[row][col] {
                    case ".": strangeLights.turnTheLightsOff(xX: row, yY: col)
                    case "#": strangeLights.turnTheLightsOn(xX: row, yY: col)
                    default: print("divný znak u switche")
                }
            }
        }
        //part 2 rožínání rohových světel
        strangeLights.turnTheLightsOn(xX: gridSize-1, yY: gridSize-1)
        strangeLights.turnTheLightsOn(xX: 0, yY: 0)
        strangeLights.turnTheLightsOn(xX: 0, yY: gridSize-1)
        strangeLights.turnTheLightsOn(xX: gridSize-1, yY: 0)
        //print(strangeLights.debugDescription)
        strangeLights.countNeighbours()
        //print(strangeLights.debugDescription)
        for i in 0..<100 {
            print("Změna číslo \(i+1):\n")
            strangeLights.changeLightsPart2()
            strangeLights.countNeighbours()
            //print(strangeLights.debugDescription)
        }
        print("Počet svítících světel je: ", strangeLights.grid.reduce(0) {$0 + ($1.isGlowing ? 1 : 0)} )
    }
}

class Lights {
    
    var isGlowing: Bool
    var neighbours: Int
    
    init(_ isGlowing: Bool = false, neighbours: Int = 0) {

        self.isGlowing = isGlowing
        self.neighbours = neighbours
    }

    
    var debugDescription: String {
        "\(isGlowing ? "☀️" : "🌑")"
    }
}

struct LightGrid {
    var grid: [Lights]
    let size: Int
    
    init(gridSize: Int) {
        grid = Array(repeating: false, count: gridSize*gridSize).map { _ in Lights() }
        size = gridSize
    }
    var debugDescription: String {
        var s = ""
        print("Začátek výpisu \(s) size: \(size)")
        for row in 0..<size {
            for col in 0..<size {
            
                s += grid[col*size+row].debugDescription + String(grid[col*size+row].neighbours)
            }
                s += "\n"
        }
        
        
        s += "\n"
        return s
    }

    
    mutating func turnTheLightsOn(xX: Int, yY: Int) {
        
        
        grid[yY*size+xX].isGlowing = true
          
        
        
    }
    
    mutating func turnTheLightsOff(xX: Int, yY: Int) {
        
        grid[yY*size+xX].isGlowing = false
        
        
        
    }
    func countNeighbours() {
        
        for row in 0..<size {
            for col in 0..<size {
                grid[col*size+row].neighbours = 0
            }
        }
        
        for row in 0..<size {
            for col in 0..<size {
                
                    //prozkoumám sousedy a přidám počet sousedů, kteří svítí
                    if (col > 0) && grid[(col-1)*size+row].isGlowing {
                        grid[col*size+row].neighbours += 1
                    }
                    if (col > 0) && (row > 0) && grid[(col-1)*size+row-1].isGlowing {
                        grid[col*size+row].neighbours += 1
                    }
                    if (row > 0) && grid[(col)*size+row-1].isGlowing {
                        grid[col*size+row].neighbours += 1
                    }
                    if (col < size-1) && (row > 0) && grid[(col+1)*size+row-1].isGlowing {
                        grid[col*size+row].neighbours += 1
                    }
                    if (col < size-1) &&  grid[(col+1)*size+row].isGlowing {
                        grid[col*size+row].neighbours += 1
                    }
                    if (col < size - 1) && (row < size - 1) && grid[(col+1)*size+row+1].isGlowing {
                        grid[col*size+row].neighbours += 1
                    }
                    if  (row < size - 1) && grid[(col)*size+row+1].isGlowing {
                        grid[col*size+row].neighbours += 1
                    }
                    if (col > 0) && (row < size - 1) && grid[(col-1)*size+row + 1].isGlowing {
                        grid[col*size+row].neighbours += 1
                    }

                
            }
        }
    }
    func changeLights() {
        for row in 0..<size {
            for col in 0..<size {
                if grid[col*size+row].isGlowing == true && (grid[col*size+row].neighbours == 2 || grid[col*size+row].neighbours == 3) {
                    grid[col*size+row].isGlowing = true
                } else {
                    grid[col*size+row].isGlowing = false
                }
                if grid[col*size+row].isGlowing == false && grid[col*size+row].neighbours == 3 {
                    grid[col*size+row].isGlowing = true
                }
            }
        }
    }
    
    func changeLightsPart2() {
        for row in 0..<size {
            for col in 0..<size {
                if grid[col*size+row].isGlowing == true && (grid[col*size+row].neighbours == 2 || grid[col*size+row].neighbours == 3) {
                    grid[col*size+row].isGlowing = true
                } else {
                    grid[col*size+row].isGlowing = false
                }
                if grid[col*size+row].isGlowing == false && grid[col*size+row].neighbours == 3 {
                    grid[col*size+row].isGlowing = true
                }
            }
        }
        grid[0*size+0].isGlowing = true
        grid[size*size-1+0].isGlowing = true
        grid[0*size+size-1].isGlowing = true
        grid[(size-1)*(size-1)+size-1].isGlowing = true
    }
            
}
