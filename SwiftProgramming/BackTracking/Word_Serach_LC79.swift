//
//  Word_Serach_LC79.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 11/3/23.
//

import Foundation
/*
    Time: - (m*n)* 3^L (L is ythe length of the word)
 
    Space :- Depth of the Tree i.e O(L)
 
    Isue - you created a visited arr wi=hich is not help in this
 */

class Word_Search {
    func solExist(_ board: inout [[Character]], _ word: [Character], _ idx : Int , _ x: Int,
                  _ y: Int, _ rowLen: Int, _ colLen: Int ) -> Bool {
        if idx == word.count {
            return true
        }
        
        guard x >= 0, y >= 0 , x < rowLen , y < colLen, board[x][y] == word[idx] else {
            return false
        }
        
        board[x][y] = "#"
        let charValue = word[idx]
        var ans = false
        
        ans = solExist(&board, word, idx + 1, x + 1, y , rowLen, colLen)
              || solExist(&board, word, idx + 1, x - 1, y , rowLen, colLen)
              || solExist(&board, word, idx + 1, x , y + 1 , rowLen, colLen)
              || solExist(&board, word, idx + 1, x, y - 1 , rowLen, colLen)
        
        if ans == true {
            return ans
        }
        board[x][y] = charValue
        
        return ans
        
        
    }
    
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count , n = board[0].count
        var board = board
        let word = Array(word)
        for i in 0..<m {
            for j in 0..<n {
                if solExist(&board, word, 0, i, j , m , n) {
                    return true
                }
            }
        }
        
        return false
    }
}
