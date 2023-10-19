//
//  순위.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/19.
//

import Foundation

func timeout(_ n:Int, _ results:[[Int]]) -> Int {
    
    func forGrade(_ nodes: [Int]) {
        let canGrade = nodes.count + lose[nodes.last!].count == n
        for i in lose[nodes.last!] {
            forGrade(nodes + [i])
        }
        if canGrade {
            ans = max(ans, nodes.count)
        }
    }
    
    var lose = [[Int]](repeating: [], count: n)
    var canStart = [Bool](repeating: true, count: n)
    for i in results {
        lose[i[1]-1].append(i[0]-1)
        canStart[i[0]-1] = false
    }
    
    var ans = 0
    let startIdx = canStart.firstIndex(of: true)
    if startIdx != nil {
        forGrade([startIdx!])
    }
    return ans
}
