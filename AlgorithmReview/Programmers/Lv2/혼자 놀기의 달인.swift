//
//  혼자 놀기의 달인.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/26.
//

import Foundation

func solution(_ cards:[Int]) -> Int {
    
    var visit = [Bool](repeating: false, count: cards.count )
    var group = [Int]()
    for i in (0..<cards.count) {
        
        if visit[i] { continue }
        
        var count = 0
        var target = i
        while !visit[target]{
            count += 1
            visit[target] = true
            target = cards[target] - 1
        }
        group.append(count)
    }
    
    if group.count == 1 {
        return 0
    } else {
        group.sort(by: >)
        return group[0] * group[1]
    }
}
