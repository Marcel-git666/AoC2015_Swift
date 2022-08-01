//
//  day15.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 30.04.2022.
//

import Foundation

enum Day15 {
    static func run() {
        let punctuationChars = CharacterSet.punctuationCharacters
        let minusChar = CharacterSet(charactersIn: "-")
        let specialChars = punctuationChars.subtracting(minusChar)
        
        let input = readFile("Resources/day15.input")
        print(input)
        let lines = input.lines
        print(lines)
        var ingredients = [Ingredients]()
        var ingredient = Ingredients()
        for line in lines {
            let components = line.split(separator: " ")
            let name = components[0].trimmingCharacters(in: specialChars)
            let capacity = components[2].trimmingCharacters(in: specialChars)
            let durability = components[4].trimmingCharacters(in: specialChars)
            let flavor = components[6].trimmingCharacters(in: specialChars)
            let texture = components[8].trimmingCharacters(in: specialChars)
            let calories = components[10].trimmingCharacters(in: specialChars)
           
//            ingredient = Ingredients.init(name: String(name), capacity: Int(capacity)!, durability: Int(durability)!, flavor: Int(flavor)!, texture: Int(texture)!, calories: Int(calories)!)
            ingredient.name = String(name)
            ingredient.capacity = Int(capacity)!
            ingredient.durability = Int(durability)!
            ingredient.flavor = Int(flavor)!
            ingredient.texture = Int(texture)!
            ingredient.calories = Int(calories)!
            ingredients.append(ingredient)
        
        }
        print(ingredients)
        solvePartOne(i: ingredients)
        solvePartTwo(i: ingredients)
        
    }
}

struct Ingredients {
    var name = ""
    var capacity = 0
    var durability = 0
    var flavor = 0
    var texture = 0
    var calories = 0
//    init(name: String, capacity: Int, durability: Int, flavor: Int, texture: Int, calories: Int) {
//        self.name = name
//        self.capacity = capacity
//        self.durability = durability
//        self.flavor = flavor
//        self.texture = texture
//        self.calories = calories
//    }

}



func solvePartTwo(i: [Ingredients]) {
    
    let teaspoonCount = 100
    

    func processIngredients(i: [Ingredients], first: Int, second: Int, third: Int, fourth: Int) -> Int {
        var sum = 0
        var cap = 0
        var tex = 0
        var fla = 0
        var dur = 0
        var cal = 0
        let numberOfCalories = 500
        
        
        let multiplier = [first, second, third, fourth]
        for j in 0..<4 {
            cap += i[j].capacity*multiplier[j]
            tex += i[j].texture*multiplier[j]
            fla += i[j].flavor*multiplier[j]
            dur += i[j].durability*multiplier[j]
            cal += i[j].calories*multiplier[j]
//            print("Sum is \(sum), ingredient is \(i[j].name)")
        }
        if cap < 0 {
            cap = 0
        }
        if tex < 0 {
            tex = 0
        }
        if fla < 0 {
            fla = 0
        }
        if dur < 0 {
            dur = 0
        }
        sum = cap * tex * fla * dur
        return cal == numberOfCalories ? sum : 0
    }
    var allPossibleCookies: [Int] = []
    
    for prvni in 0...teaspoonCount {
        for druhy  in 0...teaspoonCount-prvni {
            for treti in 0...teaspoonCount-prvni-druhy {
                let ctvrty = teaspoonCount-prvni-druhy-treti
                    if (prvni + druhy + treti + ctvrty) == teaspoonCount {
//                        print("Prvni je \(prvni), druhy je \(druhy), treti je \(treti) a ctvrty je \(ctvrty) a suma je \(prvni+druhy+treti+ctvrty)")
                        let number = processIngredients(i: i, first: prvni, second: druhy, third: treti, fourth: ctvrty)
//                        print(number)
                        allPossibleCookies.append(number)
                    }
                
            }
                    
        }
    
    }
    print("Part 1: Maximum je \(String(describing: allPossibleCookies.max())).")
    
}


func solvePartOne(i: [Ingredients]) {
    
    let teaspoonCount = 100
    

    func processIngredients(i: [Ingredients], first: Int, second: Int, third: Int, fourth: Int) -> Int {
        var sum = 0
        var cap = 0
        var tex = 0
        var fla = 0
        var dur = 0
        
        let multiplier = [first, second, third, fourth]
        for j in 0..<4 {
            cap += i[j].capacity*multiplier[j]
            tex += i[j].texture*multiplier[j]
            fla += i[j].flavor*multiplier[j]
            dur += i[j].durability*multiplier[j]
//            print("Sum is \(sum), ingredient is \(i[j].name)")
        }
        if cap < 0 {
            cap = 0
        }
        if tex < 0 {
            tex = 0
        }
        if fla < 0 {
            fla = 0
        }
        if dur < 0 {
            dur = 0
        }
        sum = cap * tex * fla * dur
        return sum
    }
    var allPossibleCookies: [Int] = []
    
    for prvni in 0...teaspoonCount {
        for druhy  in 0...teaspoonCount-prvni {
            for treti in 0...teaspoonCount-prvni-druhy {
                let ctvrty = teaspoonCount-prvni-druhy-treti
                    if (prvni + druhy + treti + ctvrty) == teaspoonCount {
//                        print("Prvni je \(prvni), druhy je \(druhy), treti je \(treti) a ctvrty je \(ctvrty) a suma je \(prvni+druhy+treti+ctvrty)")
                        let number = processIngredients(i: i, first: prvni, second: druhy, third: treti, fourth: ctvrty)
//                        print(number)
                        allPossibleCookies.append(number)
                    }
                
            }
                    
        }
    
    }
    print("Part 2: Maximum je \(String(describing: allPossibleCookies.max())).")
    
}
