//
//  지도 자동 구축.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2024/02/02.
//

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: n+1)
dp[0] = 2

for i in 1...n {
    dp[i] = 2*dp[i-1]-1
}

print(dp[n]*dp[n])
