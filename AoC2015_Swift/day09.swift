//
//  day09.swift
//  AoC2015_Swift
//
//  Created by Marcel Mravec on 15.02.2022.
//

import Foundation
enum Day09 {
    static func run() {
        
        
        
        let input = readFile("Resources/day09.input")
        let graph = AdjacencyMatrix<String>()
        var destinations: [Vertex<String>] = []
        
        let lines = input.lines
         print(lines)
        
        for line in lines {
            print(line)
            var sourcePosition = 0
            var destinationPosition = 0
            let components = line.split(separator: " ")
            let city1 = components[0].trimmingCharacters(in: .whitespaces)
            if !graph.vertices.description.contains(city1) {
                let source = graph.createVertex(data: city1)
                destinations.append(source)
                sourcePosition = destinations.endIndex - 1
            } else {
                for (index, dest) in destinations.enumerated() {
                    if dest.data == city1 {
                        sourcePosition = index
                    }
                }
            }

            
            let city2 = components[2].trimmingCharacters(in: .whitespaces)
            if !graph.vertices.description.contains(city2) {
                let destination = graph.createVertex(data: city2)
                destinations.append(destination)
                destinationPosition = destinations.endIndex - 1
            } else {
                for (index, dest) in destinations.enumerated() {
                    if dest.data == city2 {
                        destinationPosition = index
                    }
                }
            }

            
            let distance = Double(components[4].trimmingCharacters(in: .whitespaces)) ?? 0
//            print("Source je \(destinations[sourcePosition]) Destination je \(destinations[destinationPosition])")
            graph.add(.undirected, from: destinations[sourcePosition], to: destinations[destinationPosition], weight: distance)
        }
        print(graph)
        print(destinations)

        print("Permutace:")
        var totalWeight: [Double] = []
        permuteWirth(destinations, destinations.count-1, graph, &totalWeight)
        print("Part 1:", totalWeight.min()!)
        print("Part 2:", totalWeight.max()!)
        

        
        print("Konec")
    }
}



func permuteWirth<T>(_ a: [T], _ n: Int, _ g: AdjacencyMatrix<String>, _ totalWeight: inout [Double]) {
    var weight = 0.0
      if n == 0 {
 //         print(a)   // display the current permutation
          for (index, value) in a.enumerated() {
//              print("Tisknu a\(index):")
//              print(a[index])
              if index < a.count - 1 {
                  weight += g.weight(from: value as! Vertex<String>, to: a[index+1] as! Vertex<String>)!
              }
              
          }
          totalWeight.append(weight)
//          print("Celková vzdálenost je \(weight)")
          
      } else {
        var a = a
        permuteWirth(a, n - 1, g, &totalWeight)
        for i in 0..<n {
          a.swapAt(i, n)
          permuteWirth(a, n - 1, g, &totalWeight)
          a.swapAt(i, n)
        }
      }
    }
    
    


