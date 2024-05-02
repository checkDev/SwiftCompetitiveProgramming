//
//  NextPermutation_L.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/12/23.
//
/*
 - Logic
 a) find the idx where we have less value - pivotIdx
 
 b) get that, thaen we need to swap with next hightese one from right
 
 1 3 2
 
 -> 2 3 1
 
 c) then we not to reverse the list from pivotIdx + 1 to the end to get the least biggest number
 
 if you are the bigges t one already i.e all decreasing ,of step a) go to all smallest by just reversing it
 
 
 */

import Foundation
class NextPermutation {
    func nextPermutation(_ nums: inout [Int]) {
        var idx = nums.count - 1
        
        while idx > 0 {
            if nums[idx - 1] < nums[idx] {
                break
            }
            idx -= 1
        }
        // all are descending then return the ascending order
        let pivotIdx = idx - 1
        //print("\(pivotIdx)")
        if pivotIdx == -1 {
            nums.sort()
            return
        }

        idx = nums.count - 1
        
        while idx > pivotIdx,
            nums[idx] <= nums[pivotIdx] {
                 idx -= 1
        }

        nums.swapAt(idx, pivotIdx)
        nums[pivotIdx + 1..<nums.count].reverse()
 
    }
}
