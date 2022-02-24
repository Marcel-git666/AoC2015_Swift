//
//  day10.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 20.02.2022.
//

import Foundation


enum Day10 {
    static func run() {
        
        var input = readFile("Resources/day10.input")
        input = input.trimmingCharacters(in: .whitespacesAndNewlines)
        print(input)
        
        for _ in 0..<50 {
            var newString = ""
            var previousChar: String?
            var numberOfMatchingPrevChars = 0
            var charCounter = 0
            for digit in input {
                let stringDigit = String(digit)
                if stringDigit == previousChar && charCounter > 0 {
                    numberOfMatchingPrevChars += 1
                } else {
                    if charCounter > 0 {
                        newString += String(numberOfMatchingPrevChars) + previousChar!
                    }
                    previousChar = stringDigit
                    numberOfMatchingPrevChars = 1
                }
                
                charCounter += 1
            }
            newString += String(numberOfMatchingPrevChars) + previousChar!
            input = newString
//            print(input)
        }

        print(input.count)

    }
}
