//
//  점프와 순간 이동.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/25.
//

import Foundation

//효율성 테스트 시간 초과
func solution1(_ n:Int) -> Int {
    var dp = [Int?](repeating: nil, count: n+1)
    dp[0] = 0
    dp[1] = 1
    
    for i in 1...n{
        dp[i] = min(dp[i] ?? Int.max, dp[i-1]! + 1)
        let teleport = i * 2
        if(teleport <= n){
            dp[teleport] = min(dp[i]!, dp[teleport] ?? Int.max)
        }
    }
    return dp[n]!
}

func solution2(_ n:Int) -> Int {
    var n = n
    var count = 0
    while(n > 0){
        if(n % 2 == 0){
            n /= 2
        }else{
            n -= 1
            count += 1
        }
    }
    return count
}
