//
//  CountAndSay_38.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 8/12/23.
//

import Foundation


// https://stackoverflow.com/questions/39677330/how-does-string-substring-work-in-swift

extension String {
    subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

class CountAndSay {
    
    func countAndSay(_ n: Int) -> String {
           if n < 0 {
               return ""
           }
           
           var count = 1
           var ans = "1"
           var newStr = ""
           
        for _ in 1..<n {
               count = 1
               newStr = ""
            for j in 1...ans.count {
                if j < ans.count && ans[j-1] == ans[j] {
                      count += 1
                   } else {
                       newStr += String(count) + String(ans[j-1])
                   }
               }
               ans = newStr
           }
           return ans
           
           
           
       }
}

