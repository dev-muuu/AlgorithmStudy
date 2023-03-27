//
//  멀리 뛰기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/27.
//

import Foundation

func solution(_ n:Int) -> Int {
    var dp = [Int](repeating: 0, count: 2001)
    dp[1] = 1
    dp[2] = 2
    for i in stride(from: 3, to: n+1, by: +1){
        dp[i] = (dp[i-1] + dp[i-2]) % 1234567
    }
    return dp[n]
}
