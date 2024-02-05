//
//  연속된 부분 수열의 합.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/06.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var start = 0, end = 0
    var sum = sequence.first!
    var answer = [0, sequence.count]
    while start < sequence.count {
        if sum == k {
            if end-start < answer[1]-answer[0] {
                answer = [start, end]
            }
            if end + 1 < sequence.count {
                end += 1
                sum += sequence[end]
            } else {
                break
            }
        }
        else if sum < k {
            if end + 1 < sequence.count {
                end += 1
                sum += sequence[end]
            } else {
                break
            }
        }
        else {
            sum -= sequence[start]
            start += 1
        }
    }
    
    return answer
}
