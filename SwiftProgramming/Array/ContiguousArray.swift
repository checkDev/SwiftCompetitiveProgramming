//
//  ContiguousArray.swift
//  SwiftProgramming
//
//  Created by rsaha on 5/2/24.
//

import Foundation


//https://leetcode.com/problems/contiguous-array/submissions/

class ContiguousArray {
    func findMaxLength(_ nums: [Int]) -> Int {
        var map : [Int: Int] = [:]
        var sum = 0, ans = 0
        for(index , num) in nums.enumerated() {
            let k = num == 1 ? -1 : 1
            sum += k
            
            if sum == 0 {
                ans = index + 1
            } else if let oldIdx = map[sum] {
                ans = max(ans, index - oldIdx)
                //print("\(index - oldIdx)  \(index)  \(sum)")
            } else {
                map[sum] = index
            }
        }
        return ans
    }
}
