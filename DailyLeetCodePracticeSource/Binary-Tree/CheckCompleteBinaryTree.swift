//
//  CheckCompleteBinaryTree.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/12/23.
//
//https://leetcode.com/problems/check-completeness-of-a-binary-tree/
import Foundation

class CheckCompleteBinaryTree {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        var que = [TreeNode?]()
        
        que.append(root)
        var isNull = false
        while !que.isEmpty {
            let elem = que.removeFirst()
            if elem != nil {
                if isNull == true {
                    return false
                }
                que.append(elem?.left)
                que.append(elem?.right)
            } else {
                isNull = true
            }
            
        }
        return true
        
    }
}
