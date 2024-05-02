//
//  testLC_Oct3.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/3/23.
//

//LC 865
//https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/

/*
 Use BFS and then with the deepest left and right most find the LCA
 
 OR,
 
 Explanatoin
 Write a sub function deep(TreeNode root).
 Return a pair(int depth, TreeNode subtreeWithAllDeepest)

 In sub function deep(TreeNode root):

 if root == null,
 return pair(0, null)

 if left depth == right depth,
 deepest nodes both in the left and right subtree,
 return pair (left.depth + 1, root)

 if left depth > right depth,
 deepest nodes only in the left subtree,
 return pair (left.depth + 1, left subtree)

 if left depth < right depth,
 deepest nodes only in the right subtree,
 return pair (right.depth + 1, right subtree)


 Complexity
 Time O(N)
 Space O(height)
 */
import Foundation
public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
}

extension TreeNode : Equatable {
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val && lhs.left == rhs.left  && lhs.right == rhs.right
    }
}

class DeepestSubTreeSolution1 {
    func computeTheDepthAndSubTree(_ root: TreeNode?) -> (root: TreeNode? , depth: Int) {
        if root == nil {
            return (nil, 0)
        }
        let l = computeTheDepthAndSubTree(root?.left)
        let r = computeTheDepthAndSubTree(root?.right)
        
        return (l.1 == r.1 ? root : (l.1 > r.1 ? l.0 : r.0 ), max(l.1, r.1) + 1)
        
    }
    
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        let ans = computeTheDepthAndSubTree(root)
        return ans.0
    }
}

class DeepestSubTreeSolution2 {

    func lca(_ root: TreeNode?, _ a: TreeNode?, _ b : TreeNode?) -> TreeNode? {
       if root == nil {
           return root
       }
       if root == a || root == b {
           return root
       }
       let l = lca(root?.left, a, b)
       let r = lca(root?.right, a, b)
       
       return l != nil ? (r != nil ? root: l) : r
    }
    
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        
        var que: [TreeNode?] = []
        if root != nil {
            que.append(root)
        }
        var leftMost: TreeNode?
        var rightMost: TreeNode?
        while !que.isEmpty {
            let cnt = que.count
            //print("find lca cnt:\(cnt)")
            leftMost = que.first!
            rightMost = que.last!
            for i in 0..<cnt {
               let elem = que[i]
               if elem?.left != nil {
                   que.append(elem?.left)
               }
               if elem?.right != nil {
                   que.append(elem?.right)
               }
            }
            que.removeSubrange(0..<cnt)
        }
        return lca(root, leftMost, rightMost)
        
        
    }
}
