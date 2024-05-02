//
//  LongestCommonPrefix.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 8/17/23.
//

import Foundation
//extension String {
//    subscript(i: Int) -> Character {
//        return self[index(startIndex, offsetBy: i)]
//    }
//}



class LongestCommonPrefixSolution {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        var ans: String = ""
        guard let firstString = strs.first else {
            return ans
        }
        for i in 0...firstString.count {
            let c = firstString[firstString.index(firstString.startIndex, offsetBy: i)]
            for (index, str) in strs.enumerated() {
                if index == 0 {
                    continue
                }
                if i >= str.count
                    || c != str[str.index(str.startIndex , offsetBy: i)] {
                    return ans
                }
                
            }
            ans.append(c)
        }
        return ans
    }
    
    func longestCommonPrefix2(_ strs: [String]) -> String {
        var ans: String = ""
        guard let firstString = strs.first else {
            return ans
        }
        for i in 0...firstString.count {
            let c = firstString[i]
            for (index, str) in strs.enumerated() {
                if index == 0 {
                    continue
                }
                if i >= str.count
                    || c != str[i] {
                    return ans
                }
                
            }
            ans.append(c)
        }
        return ans
    }
    
}


