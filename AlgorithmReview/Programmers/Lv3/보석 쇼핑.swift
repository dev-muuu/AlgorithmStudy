//
//  보석 쇼핑.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation

func solution(_ gems:[String]) -> [Int] {

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
