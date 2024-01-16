//
//  택배 상자.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/05.
//

import Foundation

func solution(_ order:[Int]) -> Int {
    
    let n = order.max()!
    
    var p = 0
    var container = [Int]()
    var answer = 0
    
    for i in 1...n {
        
        container.append(i)
        
        while p < order.count && container.last == order[p] {
            answer += 1
            container.removeLast()
            p += 1
        }
    }
    
    return answer
}
