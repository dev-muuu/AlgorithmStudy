//
//  징검다리 건너기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/10.
//

import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    
    var left = 1, right = 200000000
    
    while left <= right {
        let mid = (left + right) / 2
        var cnt = 0
        for s in stones {
            if s - mid <= 0 {
                cnt += 1
                if cnt == k { break }
            } else {
                cnt = 0
            }
        }
        if cnt >= k {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return left
}
