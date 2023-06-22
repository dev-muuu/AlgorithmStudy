//
//  두 큐 합 같게 만들기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var queue1 = queue1, queue2 = queue2
    var sum1 = 0; for i in queue1{ sum1 += i }
    var sum2 = 0; for i in queue2{ sum2 += i }
    var pointer1 = 0, pointer2 = 0

    while pointer1 < queue1.count && pointer2 < queue2.count && pointer1 + pointer2 <= 600000 {
        if sum2 > sum1 {
            let pop = queue2[pointer2]
            sum1 += pop
            sum2 -= pop
            pointer2 += 1
            queue1.append(pop)
        } else if sum2 < sum1 {
            let pop = queue1[pointer1]
            sum1 -= pop
            sum2 += pop
            pointer1 += 1
            queue2.append(pop)
        } else {
            return pointer1 + pointer2
        }
    }
    return -1
}

func reference(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var queue = queue1 + queue2
    var sum1 = 0; for i in queue1{ sum1 += i }
    var sum2 = 0; for i in queue2{ sum2 += i }
    
    let mid = (sum1 + sum2) / 2
    var pointer1 = 0, pointer2 = queue1.count
    var count = 0
    while pointer1 <= pointer2 && pointer2 < queue.count {
        if sum1 > mid {
            sum1 -= queue[pointer1]
            pointer1 += 1
        } else if sum1 < mid {
            sum1 += queue[pointer2]
            pointer2 += 1
        } else {
            return count
        }
        count += 1
    }
    return -1
}
