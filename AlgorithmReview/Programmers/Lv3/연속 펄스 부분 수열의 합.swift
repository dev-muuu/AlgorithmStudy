//
//  연속 펄스 부분 수열의 합.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/16.
//

import Foundation

func solution(_ sequence:[Int]) -> Int {

    let first = sequence.first!
    var ans = max(first, -first)
    
    func check(_ remain: Int) {
        
        var dp = [Int](repeating: 0, count: sequence.count)
        dp[0] = 0 == remain ? -sequence[0] : sequence[0]

        for idx in (1..<sequence.count) {
            let value = idx % 2 == remain ? -sequence[idx] : sequence[idx]
            dp[idx] = max(dp[idx-1], 0) + value
            ans = max(ans, dp[idx])
        }
    }
    
    check(0)
    check(1)
    
    return ans
}
