//
//  보석 쇼핑.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation

func solution1(_ gems:[String]) -> [Int] {

    let jew = Set<String>(gems)
    var map = [String:Int]()
    var ans = (1, gems.count+1)
    var queue = [Int]()
    for (i,g) in gems.enumerated(){

        map[g] = i
        queue.append(i)

        if i != 0 && g == gems[queue.first!] {
            queue.removeFirst()
        }

        if map.count == jew.count {
            var first = queue.first!
            while first != map[gems[first]]!{
                queue.removeFirst()
                first = queue.first!
            }
            if i - first < ans.1 - ans.0 {
                ans = (first + 1, i + 1)
            }
        }
    }
    return [ans.0, ans.1]
}

func solution2(_ gems:[String]) -> [Int] {
    
    let types = Set(gems)
    
    var ans = [0, gems.count]
    var map = [gems.first!:1]
    var l = 0, r = 0
    while r < gems.count && l <= r{
        if map.count == types.count {
            if ans[1]-ans[0] > r-l {
                ans = [l, r]
            }
            let left = gems[l]
            map[left]! -= 1
            if map[left]! == 0 {
                map.removeValue(forKey:left)
            }
            l += 1
        } else if map.count < types.count {
            r += 1
            if r == gems.count { break }
            let right = gems[r]
            if map[right] == nil {
                map[right] = 0
            }
            map[right]! += 1
        }
    }
    return ans.map{ $0 + 1 }
}
