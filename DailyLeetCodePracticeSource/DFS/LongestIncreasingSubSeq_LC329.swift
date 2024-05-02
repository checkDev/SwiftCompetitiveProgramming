//
//  LongestIncreasingSubSeq_LC329.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/12/23.
//

//PracticeAgain
//https://leetcode.com/problems/longest-increasing-path-in-a-matrix/

/*
 DFS tarversal type problem
 
 * Time complexity  O(mn). Each vertex/cell will be calculated once and only once, and each edge will be visited once and only once. The total time complexity is then   O(V+E). �    V is the total number of vertices and �    E is the total number of edges. In our problem, �  O(V)=O(mn),    O(E)=O(4V)=O(mn). 
 * Space complexity :    O(mn). The cache dominates the space complexity. 

 */
import Foundation


class LongestIncreasingPathInMatrix {
    func util(_ matrix: [[Int]], _ i: Int, _ j: Int, _ m: Int, _ n: Int, _ cache: inout [[Int]]) -> Int {
         if cache[i][j] != -1 {
            return cache[i][j]
        }

        var longestLength = 1
        
        for dir in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let x = i + dir.0, y = j + dir.1

            if x >= 0 && x < m && y >= 0 && y < n && matrix[x][y] > matrix[i][j] {
                let candidate = util(matrix, x, y, m, n, &cache) + 1
                
                longestLength = max(longestLength, candidate)
            }
        }
        
        cache[i][j] = longestLength
        return cache[i][j]

    }
    
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let m = matrix.count, n = matrix[0].count
        
        var res = 0, cache = Array(repeating: Array(repeating: -1, count: n), count: m)
        
        
        for i in 0..<m {
            for j in 0..<n {
                res = max(res, util(matrix, i , j ,m , n, &cache))
                
            }
        }
        return res
    }
}
