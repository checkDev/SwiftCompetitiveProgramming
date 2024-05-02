//
//  GroupShiftedString_LC249.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/8/23.
//

//Repeat++
import Foundation
//https://leetcode.com/problems/group-shifted-strings/

class GroupShiftedString {
    func groupStrings(_ strings: [String]) -> [[String]] {
    
        
        var dict: [String: [String]] = [:]
        var ans = [[String]]()
        for str in strings {
            var hash = ""
            // print("yo str is \(str)")
            for i in 1..<str.count {
                 //print("str is \(str)")
                
                // Issue here
                 var diff: Int = Int(str[i].utf8.first ?? 0) - Int(str[i-1].utf8.first ?? 0)
                 //print("yo diff is \(diff)")
                 //print("\(diff)")
                 if diff < 0 {
                      diff = 26 + diff
                 }
                 hash += "\(diff)" + ","
            }
            //print("\(hash)")
            if let _ = dict[hash] {
                dict[hash]?.append(str)
                //print ("\(dict[hash])")
            } else {
                dict[hash] = [str]
            }
        }
        //print ("came here")
        for (_ , value) in dict {
            ans.append(value)
        }
        
        return ans
         
    }
}
