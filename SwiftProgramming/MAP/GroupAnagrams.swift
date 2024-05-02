//
//  GroupAnagrams.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 8/12/23.
//

import Foundation

class GroupAnagrams {
    
    func groupAnagrams2(_ strs: [String]) -> [[String]] {
        
        var countMaps = [[Character: Int] : [String]]()
        for str in strs {
            // freq map
            let counts: [Character: Int] = str.reduce(into: [:]) { counts, letter in
                counts[letter, default: 0] += 1
            }
            countMaps[counts, default: []].append(str)
        }

        return Array(countMaps.values)
    }
    
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
            var dictionaryOfKeyVales = [String: [String]]()
            var ans = [[String]]()
            for str in strs {
                let sortedStr = String(str.sorted(by: <))
                if let _ = dictionaryOfKeyVales[sortedStr] {
                    dictionaryOfKeyVales[sortedStr]?.append(str)
                } else {
                    dictionaryOfKeyVales[sortedStr] = [str]
                }
            }
            
        for (_, value) in dictionaryOfKeyVales {
                ans.append(value)
            }
            return ans
            
        }
}

