//
//  day04.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 24.01.2022.
//

import Foundation
import CryptoKit


enum Day04 {
    static func run() {
        let secretKey = "bgvyzdsv"

        var hash = MD5(string: secretKey)
        var i = 800000

        while !hash.hasPrefix("000000") {
            let target = secretKey  + String(i)
           hash = MD5(string: target)
            i += 1
        }

        print(i-1)
        print(hash)

    }

    
}
func MD5(string: String) -> String {
    let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
}

