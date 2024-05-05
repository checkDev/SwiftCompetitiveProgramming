//
//   Buildings_With_an_Ocean_View_LC1762.swift
//  SwiftProgramming
//
//  Created by rsaha on 5/4/24.
//

import Foundation


class BuildingsWithOceanView {
    
    func findBuildings(_ heights: [Int]) -> [Int] {
        var i = heights.count - 1
        guard i >= 0 else {
            return []
        }
        
        var maxHeightTillNow = Int.min
        var ans = [Int]()
        while i >= 0 {
            if heights[i] > maxHeightTillNow {
                ans.append(i)
                maxHeightTillNow = heights[i]
            }
            i -= 1
        }
        return ans.reversed()
    }
    
}
