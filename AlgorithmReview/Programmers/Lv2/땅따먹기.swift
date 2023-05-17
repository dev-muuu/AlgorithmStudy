//
//  땅따먹기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/17.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var dp = land[0]
    for i in stride(from: 1, to: land.count, by: +1){
        var temp = [Int]()
        for j in 0..<4{
            var maxValue = 0
            for k in 0..<4{
                if j == k { continue }
                maxValue = max(maxValue, dp[k])
            }
            temp.append(land[i][j] + maxValue)
        }
        dp = temp
    }
    return dp.max()!
}
