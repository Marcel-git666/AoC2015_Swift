//
//  day05.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 28.01.2022.
//

import Foundation


enum Day05 {
    static func run() {
        let input = readFile("Resources/day05.input")
        let vstup = NiceString(input: input.lines)
        let allStrings: NiceString = vstup
        print("Část jedna má \(allStrings.countNicePartOne()) nice řetězců")
        print("Část dvě má \(allStrings.countNicePartTwo()) nice řetězců")
        print("Prošli jsme \(input.lines.count) řetězců.")
        print("Konec")
    }

}


struct NiceString {
    var inputString: [String]
    init(input: [String]) {
        self.inputString = input
    }
    
    func countNicePartOne() -> Int {
        var nice = 0
        for string in inputString {

            if (!containSpecialCombination(input: string)) && moreVowels(input: string) && hasDoubleLetter(input: string){
                nice += 1
            }
        }
        return nice
    }
        
    func countNicePartTwo() -> Int {
        var nice = 0
        for string in inputString {
//            print("Procházím string: \(string)")
            
            if hasLetterXLetterRepeat(input: string) && hasPairOfLetter(input: string){
//                print("String: \(string) is nice.")
                nice += 1
            }
        }
        return nice
    }

    func containSpecialCombination(input: String) -> Bool {
        let specComb: Set = ["ab", "cd", "pq", "xy"]
        for item in specComb {
            if input.contains(item) {
                return true
            }
        }
        return false
    }
    
    func moreVowels(input: String) -> Bool {
        

        let counter = input.filter { $0 == "a" || $0 == "e" || $0 == "i" || $0 == "o" || $0 == "u"  }.count
        return counter > 2 ? true : false

    }
    
    func hasDoubleLetter(input: String) -> Bool {
        
        for (index, item) in input.enumerated() {
            
            if index > 0  {
                
                if item == input[index-1] {
                    return true
                }
            }
            
        }
        return false
    }
    
    func hasPairOfLetter(input: String) -> Bool {
        let patternToFindTwice = findDoublePattern(input: input)
//        print(patternToFindTwice)
        var counter = 0
        for twice in patternToFindTwice {
            let temp = input.components(separatedBy: twice).count-1
            if temp > 1 {
                counter = temp
            }
//                print("Pattern \(twice) je v řetězci \(input) aspoň \(temp)x.")
  
        }
        return counter > 1 ? true : false
    }
    
    func findDoublePattern(input: String) -> [String] {
        var doubleLetters: Set = [""]
        doubleLetters.remove("")
        for (index, item) in input.enumerated() {
            
            if index > 0  {
                doubleLetters.insert(String(input[index-1])+String(item))
                    
            }
            
        }
        return Array(doubleLetters)
    }
    
    func hasLetterXLetterRepeat(input: String) -> Bool {
        for (index, _) in input.enumerated() {
            
            if index > 0 && index < input.count - 1 {
                
                if input[index+1] == input[index-1] {
//                    print(input[index-1], input[index], input[index+1])
                    return true
                }
            }
            
        }
        return false
    }
}


