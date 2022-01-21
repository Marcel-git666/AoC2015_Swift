//
//  day01.swift
//  AoC2021
//
//  Created by Marcel Mravec on 17.12.2021.
//


import Foundation



enum Day01 {
    static func run() {
        let input1 = readFile("Resources/day01.input")
        print(input1)
        print(part1a(input1))
        print(part2(input1))
    }
}


func part1(_ input: String) -> Int {
    let str = input.components(separatedBy: ")").count
    let str2 = input.components(separatedBy: "(").count
    
    return str2-str
    }

func part2(_ input: String) -> Int {
    var sum = 0
    var position = 0
    for (index, value) in input.enumerated() {
        if value == "(" {
            sum += 1
        } else {
            sum -= 1
        }
        if sum < 0 {
            position = index + 1
            break
        }
    }
    
    return position
    
}

func part1a(_ input: String) -> Int {
    input.filter{($0 == "(")}.count - input.filter{($0 == ")")}.count
}

