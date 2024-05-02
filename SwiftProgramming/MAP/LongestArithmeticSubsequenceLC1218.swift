//
//  Longest_LC1218.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 8/16/23.
//

class LongestArithmeticSubsequence {
    func longestSubsequence(arr: [Int],  difference: Int) -> Int {
        if arr.count == 0 {
            return 0
        }
        
        var ans = 1
        var dict: [Int: Int] = [:]
        
        for elem in arr {
            dict[elem] = 1 + (dict[elem - difference] ?? 0)
            ans = max(ans, dict[elem] ?? 0)
        }
        return ans
    }
    
    
//    func longestSubsequence(arr: [Int],  difference: Int) -> Int {
//        if arr.count == 0 {
//            return 0
//        }
//        var ans = 1
//        var dict: [Int: Int] = [:]
//        for elem in arr {
//            dict[elem] = 1 +  (dict[elem - difference] ?? 0)
//            ans = max(ans, dict[elem] ?? 0 )
////            if let value = dict[elem - difference] {
////                dict[elem] =  value + 1
////                ans = max(ans, dict[elem] ?? 0)
////            } else {
////                dict[elem] = 1
////            }
//        }
//        return ans;
//    }
    
}
