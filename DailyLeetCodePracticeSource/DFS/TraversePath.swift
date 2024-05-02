//
//  TraversePath.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/31/23.
//

import Foundation
/*
 // Given N, where N is the size of an NxN square grid, return the number of possible paths from the top left corner to the bottom right corner, with the restriction that you can only move down or right in the grid.

 // Instead of the returning the number, let's print the possible paths
+---+---+---+ +---+---+---+ +---+---+---+
| X |   |   | | X | X | X | | X | X |   |
+---+---+---+ +---+---+---+ +---+---+---+
| X |   |   | |   |   | X | |   | X |   |
+---+---+---+ +---+---+---+ +---+---+---+
| X | X | X | |   |   | X | |   | X | X |
+---+---+---+ +---+---+---+ +---+---+---+
 DDRR          RRDD          RDDR

 RRDD
 RDRD
 RDDR
 DRRD
 DRDR
 DDRR
*/

class TraversePath {
    var dict = ["01": "R", "10": "D"]
    
    func getPathUtil(_ x: Int, _ y: Int ,_ lastRow: Int, _ lastCol: Int ,_ pathSoFar: inout String,_ visited: inout [[Bool]] ) {
        if x == lastRow , y == lastCol {
            print(pathSoFar)
            return
        }
        
        for dir in [(0,1) ,(1,0)] {
            let nextx = dir.0 + x , nexty = dir.1 + y
            if nextx >= 0,
                nextx <= lastRow,
                nexty >= 0,
                nexty <= lastCol,
                visited[nextx][nexty] == false {
                visited[nextx][nexty] = true
                let dirVal = String(dir.0) + String(dir.1)
                pathSoFar += dict[dirVal]!
                getPathUtil(nextx , nexty , lastRow , lastCol , &pathSoFar, &visited )
                pathSoFar.removeLast()
                visited[nextx][nexty] = false
            }
        }
        
    }
    func getPaths(_ row: Int, _ col: Int) {
        var str = ""
        var visited = Array(repeating: Array(repeating: false, count: col), count: row)
        getPathUtil(0 , 0 , row - 1  , col - 1, &str, &visited)
    }
}
