//
//  minMeetingRooms.swift
//  SwiftProgramming
//
//  Created by rsaha on 5/5/24.
//

import Foundation
/*
 Example 1:

 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: 2
 Example 2:

 Input: intervals = [[7,10],[2,4]]
 Output: 1

 */
class MinMeetingRoomsII {
    
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var map = [Int:Int]()
        
        for elem in intervals {
            map[elem[0], default:0] += 1
            map[elem[1], default:0] -= 1
        }
        
        let sortedMap = map.sorted { $0.key < $1.key}
        
        var meetingRooms = 0, maxMeetingRooms = 0
        
        for (_, value) in sortedMap {
            meetingRooms += value
            maxMeetingRooms = max(maxMeetingRooms, meetingRooms)
        }
        
        return maxMeetingRooms
        
    }
}
