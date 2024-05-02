//
//  Toeplitz_Matrix.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/9/23.
//

import Foundation
class Toeplitz_Matrix {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        
        for (i , num) in matrix.enumerated() {
            for (j , num2) in matrix[i].enumerated() {
                if i > 0 && j > 0 {
                    if matrix[i][j] != matrix[i - 1 ][j - 1] {
                        return false
                    }
                }
            }
            
        }
        return true
    }
}
