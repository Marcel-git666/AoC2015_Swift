//
//  day14.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 24.04.2022.
//

import Foundation

enum Day14 {
    static func run() {
        let input = readFile("Resources/day14.input")
        print(input)
        let lines = input.lines
        var reindeers: [Reindeer] = []
        var reindeer: Reindeer
        for line in lines {
            let components = line.split(separator: " ")
            reindeer = Reindeer.init(name: String(components[0]), speed: Int(components[3])!, lengthOfFly: Int(components[6])!, rest: Int(components[13])!)
            reindeers.append(reindeer)
        }
        print(reindeers)
        let l = letThemFly(r: reindeers)
        print("Part 1 vzdálenost je \(l).")
    }
}

struct Reindeer {
    var name: String
    var speed: Int
    var lengthOfFly: Int
    var rest: Int
    init(name: String, speed: Int, lengthOfFly: Int, rest: Int) {
        self.name = name
        self.speed = speed
        self.lengthOfFly = lengthOfFly
        self.rest = rest
    }
}

func letThemFly(r: [Reindeer]) -> Int {
    let endTime = 2503
    var totalDistance : [Int] = []
    var distance = 0
    var isFlying = true
    for deer in r {
        var i = 0
        let part = endTime / (deer.lengthOfFly + deer.rest)
        let part2 = endTime - part * (deer.lengthOfFly + deer.rest)
        while i < part2 {
            if isFlying {
                distance += deer.speed
            }
            i += 1
            if i == deer.lengthOfFly {
//                print("Sob \(deer.name) přestal lítat po \(i) vteřinách a jeho vzdálenost na zbytku je \(distance) a jeho part je \(part).")
                isFlying.toggle()
            }
        }
        distance += part * deer.speed * deer.lengthOfFly
        print("Vzdálenost soba \(deer.name) je \(distance).")
        totalDistance.append(distance)
        distance = 0
        if part2 >= deer.lengthOfFly {
            isFlying.toggle()
        }
    }
    return totalDistance.max()!
}
    

