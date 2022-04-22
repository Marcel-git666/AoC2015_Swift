//
//  day13.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 20.04.2022.
//

import Foundation

enum Day13 {
    static func run() {
        let input = readFile("Resources/day13.input")
        print(input)
        let lines = input.lines
        let graph = AdjacencyMatrix<String>()
        var destinations: [Vertex<String>] = []
    
        for line in lines {
            var weight = 0.0
            print(line)
            var sourcePosition = 0
            var destinationPosition = 0
            let components = line.split(separator: " ")
            let name1 = components[0]
            if components[2] == "gain" {
                weight = Double(components[3])!}
            else {weight = -Double(components[3])!}
            let name2 = components[10].trimmingCharacters(in: .punctuationCharacters)
            print("name je \(name1), váha je \(weight), name2 je \(name2)")
            if !graph.vertices.description.contains(name1) {
                let source = graph.createVertex(data: String(name1))
                destinations.append(source)
                sourcePosition = destinations.endIndex - 1
            } else {
                for (index, dest) in destinations.enumerated() {
                    if dest.data == name1 {
                        sourcePosition = index
                    }
                }
            }
            if !graph.vertices.description.contains(name2) {
                let destination = graph.createVertex(data: String(name2))
                destinations.append(destination)
                destinationPosition = destinations.endIndex - 1
            } else {
                for (index, dest) in destinations.enumerated() {
                    if dest.data == name2 {
                        destinationPosition = index
                    }
                }
            }

            graph.add(.directed, from: destinations[sourcePosition], to: destinations[destinationPosition], weight: weight)

        }
        print(graph)
        print(destinations)
        print("Permutace:")
        var totalWeight: [Double] = []
        permuteWirth2(destinations, destinations.count-1, graph, &totalWeight)
        print("Part1 - Max:", totalWeight.max()!)
//        print("Min:", totalWeight.min()!)
//        graph.add(.directed, from: destinations[sourcePosition], to: destinations[destinationPosition], weight: distance)
    }
}

func permuteWirth2<T>(_ a: [T], _ n: Int, _ g: AdjacencyMatrix<String>, _ totalWeight: inout [Double]) {
    var weight = 0.0
      if n == 0 {
          print(a)   // display the current permutation
          
          for (index, value) in a.enumerated() {
//              print("Tisknu a\(index):")
//              print(a[index])
              if index < a.count - 1 {
                  weight += g.weight(from: value as! Vertex<String>, to: a[index+1] as! Vertex<String>)! + g.weight(from: a[index+1] as! Vertex<String>, to: value as! Vertex<String>)!
              }
              
          }
          // musíme uzavřít kruh
          weight += g.weight(from: a[0] as! Vertex<String>, to: a[a.count-1] as! Vertex<String>)! + g.weight(from: a[a.count-1] as! Vertex<String>, to: a[0] as! Vertex<String>)!
          totalWeight.append(weight)
          print("Celková vzdálenost je \(weight)")
          
      } else {
        var a = a
        permuteWirth2(a, n - 1, g, &totalWeight)
        for i in 0..<n {
          a.swapAt(i, n)
          permuteWirth2(a, n - 1, g, &totalWeight)
          a.swapAt(i, n)
        }
      }
    }
