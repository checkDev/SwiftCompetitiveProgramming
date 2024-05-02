//
//  CloneGraph_LC133.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/29/23.
//

import Foundation
//
//public class Node: Identifiable {
//     public var val: Int
//      public var neighbors: [Node?]
//     public init(_ val: Int) {
//         self.val = val
//         self.neighbors = []
//      }
//  }
//
//class CloneGraph {
//
//    func createNode(_ node: Node?) -> Node? {
//        guard let node = node else {
//            return nil
//        }
//        return Node(node.val)
//    }
//
//    func cloneGraphUtil(_ node: Node?, _ map: inout [Node? : Node?]) -> Node? {
//        guard let node = node else {
//            return nil
//        }
//
//        if let clonedNode = map[node] {
//            return clonedNode
//        }
//        var newNode = createNode(node)
//
//        for neigh in node.neighbors {
//            let mappedNode = cloneGraphUtil(neigh, &map)
//            newNode.neighbors.append(mappedNode)
//        }
//        map[node] = newNode
//        return newNode
//    }
//
//    func cloneGraph(_ node: Node?) -> Node? {
//        var map: [Node? : Node?] = [:]
//        return cloneGraphUtil(node, &map)
//
//    }
//}
