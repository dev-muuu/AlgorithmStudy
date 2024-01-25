//
//  두 큐 합 같게 만들기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var sum1 = queue1.reduce(0){ $0 + $1 }
    let totalSum = sum1 + queue2.reduce(0){ $0 + $1 }
    if totalSum % 2 != 0 {
        return -1
    }
    
    let queue = queue1 + queue2
    var p1 = 0, p2 = queue1.count
    var answer = 0
    
    while p1 < p2 && p2 < queue.count {
        if sum1 < totalSum/2 {
            sum1 += queue[p2]
            p2 += 1
        }
        else if sum1 == totalSum/2  {
            return answer
        }
        else {
            sum1 -= queue[p1]
            p1 += 1
        }
        answer += 1
    }
    
    return -1
}
