//
//  UniquePath-2.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/16/23.
//

import Foundation
// https://leetcode.com/problems/unique-paths-ii/

class UniquePath2 {
    func getUniquePathsWithObstacles(_ obstacleGrid: [[Int]],_ row: Int ,_ col: Int ,_ cache: inout [[Int]]) -> Int {
        if row == 0, col == 0 {
            return 1
        }
        if cache[row][col] != -1 {
            return cache[row][col]
        }
        var rowCount = 0 , colCount = 0
        if row >= 1 && obstacleGrid[row - 1][col] == 0 {
            rowCount = getUniquePathsWithObstacles(obstacleGrid, row - 1, col, &cache )
        }
         if col >= 1 && obstacleGrid[row][col - 1] == 0 {
            colCount = getUniquePathsWithObstacles(obstacleGrid, row, col - 1, &cache )
        }
        cache[row][col] = rowCount + colCount
        
        return  cache[row][col]
        
    }
                                     
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let row = obstacleGrid.count
        let col = obstacleGrid[0].count
        
        if row - 1 == 0 && col - 1 == 0 {
            return obstacleGrid[row-1][col-1] == 0 ? 1 : 0
        }
        if obstacleGrid[row - 1][col - 1] == 1 {
            return 0
        }
        var cache = Array(repeating: Array(repeating: -1, count: col), count: row) //Array(repeating: -1 , Array(repeating: -1 , col), row)
        
        return getUniquePathsWithObstacles(obstacleGrid, row - 1 , col - 1, &cache)
        
    }
}
