//
//  WordBreak.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/12/23.
//

import Foundation
//https://leetcode.com/problems/word-break/

class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let wordSet = Set(wordDict)
        let s = Array(s)

        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        
        for i in 1...s.count {
            for j in 0..<i {
                 let str = String(s[j..<i])
                if wordSet.contains(str), dp[j] == true {
                    dp[i] = true
                }
                
            }
        }
        return dp[s.count]
    }
}
