//
//  day11.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 26.02.2022.
//

import Foundation

enum Day11 {
    static func run() {
        
        var input = "hxbxxyzz"
        
        print(input)
        input = incrementString(input)
        while !isPasswordValid(input) {
            input = incrementString(input)
            print(input)
        }
        
        print(input)
        
    }
}

func incrementString(_ str: String) -> String {
    let asciiA = "a".asciiValue
    let asciiI = "i".asciiValue
    let asciiO = "o".asciiValue
    let asciiL = "l".asciiValue

    var characterArray = str.map { String($0).asciiValue - asciiA }
//    print("CharacterArray je: \(characterArray)")
    var idx = 7
    while idx >= 0 {
        characterArray[idx] += 1
        if characterArray[idx] == asciiI || characterArray[idx] == asciiL || characterArray[idx] == asciiO {
            characterArray[idx] += 1
        }
        if characterArray[idx] > 25 {
            characterArray[idx] = 0
            idx -= 1
        } else {
            idx = -1
        }
        
    }
    var newPassword = ""
    for i in characterArray {
        newPassword += String(UnicodeScalar(i + asciiA) ?? Unicode.Scalar(0))
    }
    return newPassword
}


func isPasswordValid(_ password: String) -> Bool {
    let asciiA = "a".asciiValue
    let length = password.count
    let characterArray = password.map { String($0).asciiValue - asciiA }
    var increasingSequenceFound = false
    for i in 0...length-3 {
        let c0 = Int(characterArray[i])
        let c1 = Int(characterArray[i + 1])
        let c2 = Int(characterArray[i + 2])
        if (c0 + 1) == c1 && (c1 + 1) == c2 {
            increasingSequenceFound = true
        }
    }
    var duplicateArray = Array<Character>()
    
    for i in 0..<password.count-1 {
        let c0 = password[i]
        let c1 = password[i+1]
        if c0 == c1 {
            if !duplicateArray.contains(password[i]) {
                duplicateArray.append(password[i])
            }
            
            
            
        }
    }
    var hasDuplicateChar = false
    if duplicateArray.count == 2 {
//        print("Duplicate array is ", duplicateArray)
        hasDuplicateChar = true
    }
    
    return increasingSequenceFound && hasDuplicateChar
}

extension String {
    var asciiValue: UInt32 {
        let c = self.unicodeScalars.first
        return c?.value ?? 0
    }
}
