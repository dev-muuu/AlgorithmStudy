//
//  숫자 변환하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/26.
//

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {

    var dp = [Int](repeating: Int.max/2, count: y+1)
    dp[x] = 0
    for j in x...y{
        if j * 2 <= y{
            dp[j*2] = min(dp[j*2], dp[j] + 1)
        }
        if j * 3 <= y{
            dp[j*3] = min(dp[j*3], dp[j] + 1)
        }
        if j + n <= y {
            dp[j+n] = min(dp[j+n], dp[j] + 1)
        }
    }
    return dp[y] == Int.max / 2 ? -1 : dp[y]
}
