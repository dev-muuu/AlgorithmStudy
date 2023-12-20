//
//  피로도.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/09.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {

    var orders = [[Int]]()
    var visit = [Bool](repeating: false, count: dungeons.count)
    func generate(_ order:[Int]) {
        
        if order.count == dungeons.count {
            orders.append(order)
            return
        }
        
        for i in 0..<dungeons.count {
            if !visit[i] {
                visit[i] = true
                generate(order + [i])
                visit[i] = false
            }
        }
    }
    
    generate([])
    var result = 0
    for order in orders {
        var remain = k
        var complete = 0
        for d in order {
            if remain >= dungeons[d][0] {
                remain -= dungeons[d][1]
                complete += 1
            }
            else {
                break
            }
        }
        result = max(result, complete)
    }
    
    return result
}
