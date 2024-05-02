//
//  ClosestBST_LC270.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/6/23.
//

import Foundation

class ClosestBST {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var diff = Double.infinity
        var ans = -1
        var root = root
        while root != nil {
            
            let completion : () -> Void = {
                let nowDiff = abs(target - Double(root?.val ?? 0))
                if  nowDiff <=  diff {
                    if diff != Double.infinity, nowDiff == diff {
                        ans =  min(ans, root?.val ?? 0)
                    } else {
                        ans =  root?.val ?? 0
                    }
                    
                    diff = nowDiff
                }
            }
            if target > Double(root?.val ?? 0) {
                completion()
                root = root?.right
            } else {
                completion()
                root = root?.left
            }
        }
        return ans
        
        
    }
}
