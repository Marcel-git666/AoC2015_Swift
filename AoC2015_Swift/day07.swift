//
//  day07.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 02.02.2022.
//

import Foundation

enum Day07 {
    static func run() {
        let input = readFile("Resources/day07.test")
        let lines = input.lines
        print(lines)
//        var wires: Wires
//        wires = .init(map: [:])
//        let wireMap = wires.performInstruction(key: "x", lines: lines)
//        print(wireMap)
        print(day07part1(lines))
        print("Prošli jsme \(input.lines.count) řetězců.")
        print("Konec")
    }

}

func day07part1(_ input: [String]) -> UInt16 {
    
    struct Operation {
        var op1 = ""
        var op2 = ""
        var opCode = ""
        var opResult = ""
        var processed = false
    }
    var wireDictionary: [String: UInt16] = [:]
    
    
    
    func parseInput() -> [Operation] {
            var operationArray = [Operation]()
            let partsArray = input
            for part in partsArray {
                var op = Operation()
                let components = part.components(separatedBy: "->")
                print("Komponenta1 je \(components[1].trimmingCharacters(in: .whitespaces)).")
                print("Komponenta0 je \(components[0].trimmingCharacters(in: .whitespaces)).")
                let left = components[0].trimmingCharacters(in: .whitespaces)
                let right = components[1].trimmingCharacters(in: .whitespaces)
                if Int16(left) != nil {
                    op.op1 = components[0].trimmingCharacters(in: .whitespaces)
                    op.op2 = ""
                    op.opResult = right
                    op.opCode = ">"
                    
                    op.processed = false
                    operationArray.append(op)
                    //print("op je ", op)
                    
                } else {
                    let new = left.split(separator: " ")
                    print("nové rozdělení je:", new)
                    switch new.count {
                    case 2: op.opCode = String(new[0])
                        op.op1 = String(new[1])
                        op.opResult = right
                    case 3: op.op1 = String(new[0])
                        op.op2 = String(new[2])
                        op.opCode = String(new[1])
                        op.opResult = right
                    default: print("Divná chyba s počtem komponent.")
                    }
                    operationArray.append(op)
                    //print("op je ", op)
                    
                }
                
                
                
            }
            return operationArray
    }
    let operationArray = parseInput()
     
    print("Netisknu struct testOP")
    //print(operationArray)
    
    var operationsProcessed = 0
    while operationsProcessed < operationArray.count {
        for op in operationArray {
            switch op.opCode {
            case ">": wireDictionary[op.opResult] = UInt16(op.op1)!
                print("operation .. ", op.op1, op.opCode, op.op2)
                print(wireDictionary)
                operationsProcessed += 1
            case "AND": if wireDictionary[op.op1] != nil && wireDictionary[op.op2] != nil {
                //print(Int(String(wireDictionary[op.op1]!))!)
                print("operation .. ", op.op1, op.opCode, op.op2)
                let result = UInt16(String(wireDictionary[op.op1]!))!
                let result2 = UInt16(String(wireDictionary[op.op2]!))!
                
                print("result 1 a 2 jsou:", result, result2)
                let processOp = result & result2
                print(processOp)
                wireDictionary[op.opResult] = processOp
                print(wireDictionary)
                operationsProcessed += 1
            }
            case "NOT": if wireDictionary[op.op1] != nil {
                print("operation .. ", op.opCode, op.op1, " -> ", op.opResult)
                let result = UInt16(String(wireDictionary[op.op1]!))!
                let processOp = ~result
                print(processOp)
                wireDictionary[op.opResult] = processOp
                print(wireDictionary)
                operationsProcessed += 1
            }
            case "OR": if wireDictionary[op.op1] != nil && wireDictionary[op.op2] != nil {
                print("operation .. ", op.op1, op.opCode, op.op2)
                let result = UInt16(String(wireDictionary[op.op1]!))!
                let result2 = UInt16(String(wireDictionary[op.op2]!))!
                
                print("result 1 a 2 jsou:", result, result2)
                let processOp = result | result2
                print(processOp)
                wireDictionary[op.opResult] = processOp
                print(wireDictionary)
                operationsProcessed += 1
            }
            case "RSHIFT": if wireDictionary[op.op1] != nil && wireDictionary[op.op2] != nil {
                //print(Int(String(wireDictionary[op.op1]!))!)
                print("operation .. ", op.op1, op.opCode, op.op2)
                let result = UInt16(String(wireDictionary[op.op1]!))!
                let result2 = UInt16(String(wireDictionary[op.op2]!))!
                
                print("result 1 a 2 jsou:", result, result2)
                let processOp = result >> result2
                print(processOp)
                wireDictionary[op.opResult] = processOp
                print(wireDictionary)
                operationsProcessed += 1
            }
            case "LSHIFT": if wireDictionary[op.op1] != nil && wireDictionary[op.op2] != nil {
                //print(Int(String(wireDictionary[op.op1]!))!)
                print("operation .. ", op.op1, op.opCode, op.op2)
                let result = UInt16(String(wireDictionary[op.op1]!))!
                let result2 = UInt16(String(wireDictionary[op.op2]!))!
                
                print("result 1 a 2 jsou:", result, result2)
                let processOp = result << result2
                print(processOp)
                wireDictionary[op.opResult] = processOp
                print(wireDictionary)
                operationsProcessed += 1
            }
            default: print("prázdné instrukce, ale jedeme dále...")
                
            }
        }
    }
    return 1
}

//struct Wires {
//    var map: [String: Int] = [:]
//
//    init(map: [String: Int]) {
//        self.map = map
//    }
//    mutating func performInstruction(key: String, lines: [String]) -> [String: Int] {
//        for line in lines {
//            let components = line.components(separatedBy: "->")
//            print("Key je \(key) a komponenta1 je \(components[1].trimmingCharacters(in: .whitespaces)).")
//            if components[1].trimmingCharacters(in: .whitespaces) == key {
//                let left = Int(components[0].trimmingCharacters(in: .whitespaces)) ?? nil
////                print("Left je \(left).")
//                if left != nil {
//                    print("left není nil")
//                    map[key] = decodeNumber(number: String(left!), lines: lines)
//                }
//            }
//        }
//        return map
//    }
//    mutating func decodeNumber(number: String, lines: [String]) -> Int {
//        let numberConverted = Int(number.trimmingCharacters(in: .whitespaces)) ?? nil
//        if numberConverted != nil {
//            if !map.keys.contains(number.trimmingCharacters(in: .whitespaces)) {
//                map = performInstruction(key: number, lines: lines)
//                return 1
//            }
//        }
//        return 1
//    }
//}
//



//func bitwiseMethods(method: String, a: Int, b: Int) -> Int  {
//    switch(method) {
//    case "AND": return a & b
//    case "OR": return a | b
//    case "NOT": return ~a
//    case "LSHIFT": return a << b
//    case "RSHIFT": return a >> b
//    default: return 0
//    }
//}
