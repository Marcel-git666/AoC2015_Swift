//
//  day16.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 01.08.2022.
//

import Foundation

enum Day16 {
    static func run() {
        let punctuationChars = CharacterSet.punctuationCharacters
        let minusChar = CharacterSet(charactersIn: "-")
        let specialChars = punctuationChars.subtracting(minusChar)
        
        let input = readFile("Resources/day16.input")
        print(input)
        let lines = input.lines
//        print(lines)
        var sue = Sue()
        var sues: [Int] = []
        var j = 1
        for line in lines {
            let components = line.split(separator: " ")
            for i in 0..<components.count {
                let property = components[i].trimmingCharacters(in: specialChars)
                switch property {
                case "children":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.children = Int(numberOfProperty)!
                    print("Sue \(j) má \(sue.children!)  dětí.")
                case "cats":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.cats = Int(numberOfProperty)!
                case "samoyeds":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.samoyeds = Int(numberOfProperty)!
                case "pomeranians":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.pomeranians = Int(numberOfProperty)!
                case "akitas":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.akitas = Int(numberOfProperty)!
                case "vizslas":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.vizslas = Int(numberOfProperty)!
                case "goldfish":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.goldfish = Int(numberOfProperty)!
                case "trees":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.trees = Int(numberOfProperty)!
                case "cars":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.cars = Int(numberOfProperty)!
                case "perfumes":
                    let numberOfProperty = components[i+1].trimmingCharacters(in: specialChars)
                    sue.perfumes = Int(numberOfProperty)!
                default: print(".")
                }
                
            }
            if (
                (sue.children == nil || sue.children! == 3)
                &&
                (sue.perfumes == nil || sue.perfumes! == 1)
                &&
                (sue.cats == nil || sue.cats! > 7)
                &&
                (sue.samoyeds == nil || sue.samoyeds! == 2)
                &&
                (sue.pomeranians == nil || sue.pomeranians! < 2)
                &&
                (sue.akitas == nil || sue.akitas! == 0)
                &&
                (sue.vizslas == nil || sue.vizslas! == 0)
                &&
                (sue.goldfish == nil || sue.goldfish! < 5)
                &&
                (sue.trees == nil || sue.trees! > 3)
                &&
                (sue.cars == nil || sue.cars! == 2)
            )
            {
                sues.append(j)
                print(j)
            }
            j += 1
            sue = Sue()
            
        }
        print(sues)
    }
}
    
struct Sue {
    var children : Int?
    var cats : Int?
    var samoyeds : Int?
    var pomeranians : Int?
    var akitas : Int?
    var vizslas : Int?
    var goldfish : Int?
    var trees : Int?
    var cars : Int?
    var perfumes : Int?
}
