//
//  스티커 모으기(2).swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2024/03/05.
//

import Foundation

func solution(_ sticker:[Int]) -> Int{
    
    if sticker.count == 1{
        return sticker[0]
    }

    var dp = [Int](repeating: 0, count: sticker.count)
    var dp2 = [Int](repeating: 0, count: sticker.count)
    
    dp[0] = sticker[0]
    dp[1] = sticker[0]
    
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in stride(from: 2, to: sticker.count-1, by: +1){
        dp[i] = max(dp[i-2] + sticker[i], dp[i-1])
    }
    
    for i in stride(from: 2, to: sticker.count, by: +1){
        dp2[i] = max(dp2[i-2] + sticker[i], dp2[i-1])
    }
    
    return max(dp.max()!, dp2.max()!)
}
