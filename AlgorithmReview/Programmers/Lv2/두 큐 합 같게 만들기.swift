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

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var sum1 = queue1.reduce(0){ $0 + $1 }
    var sum2 = queue2.reduce(0){ $0 + $1 }

    if (sum1 + sum2) % 2 == 1 { return -1 }
    
    var q1 = queue1, q2 = queue2
    let target = (sum1 + sum2) / 2
    
    if sum1 == target { return 0 }
    
    var ans = 0
    var p1 = 0, p2 = 0
    repeat {
        ans += 1
        if sum1 > target {
            let pop = q1[p1]
            q2.append(pop)
            sum2 += pop
            sum1 -= pop
            p1 += 1
        }
        else {
            let pop = q2[p2]
            q1.append(pop)
            sum1 += pop
            sum2 -= pop
            p2 += 1
        }
        
        if ans > (queue1.count + queue2.count) * 2 {
            break
        }
        if sum1 == target {
            return ans
        }
    } while !q1.isEmpty && !q2.isEmpty
    
    return -1
}
