//
//  day01.swift
//  AoC2021
//
//  Created by Marcel Mravec on 17.12.2021.
//


import Foundation



enum Day01 {
    static func run() {
        let input1 = readFile("day01.input")
        print(part1(input1))
        
    }
}


func part1(_ input: String) -> Int {
    let result =  input.components(separatedBy:"(")
    let result2 =  input.components(separatedBy:")")
  
    return (result.count-result2.count)
    }

func part2(_ input: String) -> Int {
    let str = input.split(separator: "\n").compactMap { Int($0) }
    
    return zip(str, str.dropFirst(3)).filter {$0 < $1 } .count
    
}



