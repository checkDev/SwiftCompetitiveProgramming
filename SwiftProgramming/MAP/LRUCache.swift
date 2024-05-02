//
//  LRUCache.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 8/17/23.
//

import Foundation

/*
 ["LRUCache","put","get","put","get","get","get","put","get","put","put","put","put","put","put","get","put","put","get","put","put","put","put","put","put","put","get","put","put","put","put","put","put","get","put","put","get","put","get","put","get","put","put","get","put","put","put","get","get","put","put","get","put","get","get","get","get","put","get","put","put","put","get","put","put","get","get","get","put","put","put","put","get","get","get","get","put","get","put","get","put","put","get","get","get","get","get","get","put","put","get","get","put","get","put","put","get","get","put","put","put","put","put","get","put","get","get","put","get","put","put","put","put","get","put","put","put","put","get","get","get","get","put","put","get","get","put","put","put","put","put","put","put","get","put","put","get","get","put","put","put","put","put","put","put","put","put","put","put","get","put","get","get","get","put","put","put","put","put","get","put","put","get","put","put","get...
 [[105],[33,219],[39],[96,56],[129],[115],[112],[3,280],[40],[85,193],[10,10],[100,136],[12,66],[81,261],[33,58],[3],[121,308],[129,263],[105],[104,38],[65,85],[3,141],[29,30],[80,191],[52,191],[8,300],[136],[48,261],[3,193],[133,193],[60,183],[128,148],[52,176],[48],[48,119],[10,241],[124],[130,127],[61],[124,27],[94],[29,304],[102,314],[110],[23,49],[134,12],[55,90],[14],[104],[77,165],[60,160],[117],[58,30],[54],[136],[128],[131],[48,114],[136],[46,51],[129,291],[96,207],[131],[89,153],[120,154],[111],[47],[5],[114,157],[57,82],[113,106],[74,208],[56],[59],[100],[132],[127,202],[75],[102,147],[37],[53,79],[119,220],[47],[101],[89],[20],[93],[7],[48,109],[71,146],[43],[122],[3,160],[17],[80,22],[80,272],[75],[117],[76,204],[74,141],[107,93],[34,280],[31,94],[132],[71,258],[61],[60],[69,272],[46],[42,264],[87,126],[107,236],[131,218],[79],[41,71],[94,111],[19,124],[52,70],[131],[103],[81],[126],[61,279],[37,100],[95],[54],[59,136],[101,219],[15,248],[37,91],[11,174],[99,65],[105,249],[...
 */
class LRUCache {

    //just dummy head and tails
    let caps: Int
    let head = Node(0, 0)
    let tail = Node(0, 0)
   
    var map = [Int: Node]()

    
    init(_ capacity: Int) {
        caps = capacity
        head.next = tail
        tail.prev = head
        print("head : \(head.id) -- \(tail.id)")
    }
    
    func get(_ key: Int) -> Int {
        if let nodeToBeFound = map[key] {
            delete(nodeToBeFound)
            moveNodeTohead(nodeToBeFound)
            return nodeToBeFound.value
        }
        return -1;
    }
    func moveNodeTohead(_ node: Node) {
        let firstNode = head.next
        node.next = firstNode
        firstNode?.prev = node
        head.next = node
        node.prev = head

    }
    func printNode() {
        print("++++")
        var cur = head
        while(cur.id != tail.id) {
            print("[\(cur.key) value: \(cur.value)] => ", terminator: "")
            cur = cur.next!
        }
        print("++tail: \(tail.prev?.key)")
    }
    
    func delete(_ node: Node ) {
        node.next?.prev = node.prev
        node.prev?.next  = node.next
        node.prev = nil
        node.next = nil
    }
    
    func put(_ key: Int, _ value: Int) {
        let newNode = Node(key, value)
        if let nodeToBeFound = map[key] {
                 delete(nodeToBeFound)
                 moveNodeTohead(newNode)
                 map[key] = newNode
                 return
        }
        //print(" caps now \(caps)")
        if map.count == caps {
             map[tail.prev!.key] = nil
             delete(tail.prev!)
        }
        
        map[key] = newNode
        moveNodeTohead(newNode)
        
    }
    
    class Node: Identifiable {
        let key: Int
        let value: Int
        var prev: Node?
        var next: Node?
        
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
