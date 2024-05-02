//
//  MergeSortedArrayLC88.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 8/17/23.
//

//LC 88
class MergeSortedArr {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        
        var left = m - 1, right = n - 1

        while left >= 0 || right >= 0 {
            if right < 0
                || ( left >= 0 && nums1[left] >= nums1[right]) {
                nums1[left + right + 1] = nums1[left]
                left -= 1
            } else {
                nums1[left + right + 1] = nums1[right]
                right -= 1
            }
        }
  }
}

